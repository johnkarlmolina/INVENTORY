const serviceModel = require("../model/serviceModel");
const { getAccessLevel } = require("../middleware/authMiddleware");
const { isBlank, requireAtLeastOne, trimObjectStrings } = require("../utils/validation");

exports.servicesPageRender = async (req, res) => {
    try {
        const accessLevel = getAccessLevel(req);
        res.render("services", {
            page: "services",
            title: "Computer Services",
            baseUrl: process.env.BASE_URL || "",
            accessLevel,
            isAdmin: accessLevel === "Admin",
            isTechnician: accessLevel === "IT Technician",
            services: [],
        });
    } catch (error) {
        console.error("Error rendering services page:", error);
        res.status(500).send("An error occurred while loading the services page.");
    }
};

exports.servicesDataTable = async (req, res) => {
    try {
        const {
            draw = 1,
            start = 0,
            length = 10,
            search = { value: "" },
            order = [{ column: 0, dir: "desc" }]
        } = req.body;

        const services = await serviceModel.serviceDataTable();
        const serviceList = services.map(item => ({
            service_id: item.service_id,
            serial_number: item.serial_number || "",
            property_tag: item.property_tag || "",
            problem: item.problem || "",
            remarks: item.remarks || "",
        }));

        const recordsTotal = serviceList.length;
        const searchValue = (search.value || "").toLowerCase();

        let filteredData = serviceList.filter(item =>
            item.service_id.toString().toLowerCase().includes(searchValue) ||
            item.serial_number.toLowerCase().includes(searchValue) ||
            item.property_tag.toLowerCase().includes(searchValue) ||
            item.problem.toLowerCase().includes(searchValue) ||
            item.remarks.toLowerCase().includes(searchValue)
        );

        const recordsFiltered = filteredData.length;

        const columns = [
            "service_id",
            "serial_number",
            "property_tag",
            "problem",
            "remarks",
        ];

        const columnIndex = order[0]?.column ?? 0;
        const columnName = columns[columnIndex];
        const dir = order[0]?.dir === "asc" ? "asc" : "desc";

        if (columnName) {
            filteredData.sort((a, b) => {
                const aValue = a[columnName];
                const bValue = b[columnName];
                if (aValue < bValue) return dir === "asc" ? -1 : 1;
                if (aValue > bValue) return dir === "asc" ? 1 : -1;
                return 0;
            });
        }

        const startNum = parseInt(start);
        const lengthNum = parseInt(length);
        const data = filteredData.slice(startNum, startNum + lengthNum);

        return res.json({
            draw: parseInt(draw),
            recordsTotal,
            recordsFiltered,
            data
        });
    } catch (error) {
        console.error("Error fetching services:", error);
        return res.status(500).json({
            draw: 0,
            recordsTotal: 0,
            recordsFiltered: 0,
            data: [],
            error: error.message
        });
    }
};

exports.getServiceById = async (req, res) => {
    try {
        const serviceId = Number(req.params.id);
        if (!Number.isFinite(serviceId)) {
            return res.status(400).json({ success: false, message: "Invalid service id" });
        }

        const service = await serviceModel.getComputerServiceById(serviceId);
        if (!service) {
            return res.status(404).json({ success: false, message: "Service not found" });
        }

        return res.json({ success: true, service });
    } catch (error) {
        console.error("Error fetching service:", error);
        return res.status(500).json({ success: false, message: "Failed to fetch service" });
    }
};

exports.createService = async (req, res) => {
    try {
        const body = trimObjectStrings(req.body);
        const { serial_number, property_tag, problem, remarks } = body;

        if (isBlank(problem)) {
            return res.status(400).json({ success: false, message: "Problem is required" });
        }
        if (!requireAtLeastOne(body, ["serial_number", "property_tag"])) {
            return res.status(400).json({ success: false, message: "Serial number or Property tag is required" });
        }
        await serviceModel.createComputerService({ serial_number, property_tag, problem, remarks });
        return res.json({ success: true });
    } catch (error) {
        console.error("Error creating service:", error);
        return res.status(500).json({ success: false, message: "Failed to create service" });
    }
};

exports.updateService = async (req, res) => {
    try {
        const serviceId = Number(req.params.id);
        if (!Number.isFinite(serviceId)) {
            return res.status(400).json({ success: false, message: "Invalid service id" });
        }

        const body = trimObjectStrings(req.body);
        const { serial_number, property_tag, problem, remarks } = body;
        if (isBlank(problem)) {
            return res.status(400).json({ success: false, message: "Problem is required" });
        }
        if (!requireAtLeastOne(body, ["serial_number", "property_tag"])) {
            return res.status(400).json({ success: false, message: "Serial number or Property tag is required" });
        }
        await serviceModel.updateComputerService(serviceId, { serial_number, property_tag, problem, remarks });
        return res.json({ success: true });
    } catch (error) {
        console.error("Error updating service:", error);
        return res.status(500).json({ success: false, message: "Failed to update service" });
    }
};

exports.deleteService = async (req, res) => {
    try {
        const serviceId = Number(req.params.id);
        if (!Number.isFinite(serviceId)) {
            return res.status(400).json({ success: false, message: "Invalid service id" });
        }

        await serviceModel.deleteComputerService(serviceId);
        return res.json({ success: true });
    } catch (error) {
        console.error("Error deleting service:", error);
        return res.status(500).json({ success: false, message: "Failed to delete service" });
    }
};

exports.brandSerialOptions = async(req, res) => {
    try {
        const { type_of_asset } = req.query;
        let options;
        let typeAsset;
        if (type_of_asset === "computer") {
            options = await serviceModel.brandSerialOptionsComputer();
            typeAsset = "computer";
        } else if (type_of_asset === "peripheral") {
            options = await serviceModel.brandSerialOptionsPeripheral();
            typeAsset = "peripheral";
        }
        return res.json({ success: true, options:options, typeAsset:typeAsset });
    } catch (error) {
        console.error("Error fetching brand/serial options:", error);
        return res.status(500).json({ success: false, message: "Failed to fetch options" });
    }   
};

