const peripheralModel = require("../model/peripheralModel");
exports.peripheralPageRender = async (req, res) => {    
    try {
        res.render("peripherals", {
            page: "peripherals",
            title: "Peripherals Inventory",
        });
    } catch (error) {
        console.error("Error rendering peripherals page:", error);
        res.status(500).send("An error occurred while loading the peripherals page.");
    }


}

exports.peripheralDataTable = async (req, res) => {
    try {
        const {
            draw = 1,
            start = 0,
            length = 10,
            search = {},
            order = [{ column: 0, dir: "asc" }]
        } = req.body;

        // Fetch all peripherals from model
        const peripheralsData = await peripheralModel.peripheralDataTable();

        // Convert database rows to consistent object format
        const peripheralsList = peripheralsData.map(item => ({
            peripheral_id: item.peripheral_id,
            brand: item.brand || "",
            model: item.model || "",
            date_of_purchase: item.date_of_purchase ? new Date(item.date_of_purchase) : null,
            date_of_entry: item.date_of_entry ? new Date(item.date_of_entry) : null,
            peripheral_user: item.peripheral_user || "",
            user_dept: item.user_dept || "",
            kind_of_peripheral: item.kind_of_peripheral || "",
            serial_no: item.serial_no || "",
            property_tag: item.property_tag || "",
            peripheral_no: item.peripheral_no || "",
            peripheral_status: item.peripheral_status || "",
            peripheral_location: item.peripheral_location || ""
        }));

        const searchValue = (search.value || "").toLowerCase();

        // Filter: convert all values to string for search, including dates
        const filteredData = peripheralsList.filter(item => {
            return Object.values(item).some(value => {
                if (value === null || value === undefined) return false;
                // Convert dates to ISO string
                if (value instanceof Date) {
                    return value.toISOString().toLowerCase().includes(searchValue);
                }
                return value.toString().toLowerCase().includes(searchValue);
            });
        });

        // Sorting
        const columnIndex = order[0].column;
        const dir = order[0].dir === "asc" ? 1 : -1;

        const sortedData = filteredData.sort((a, b) => {
            const aValue = Object.values(a)[columnIndex];
            const bValue = Object.values(b)[columnIndex];

            // Handle nulls
            if (aValue === null) return 1;
            if (bValue === null) return -1;

            // Dates
            if (aValue instanceof Date && bValue instanceof Date) {
                return (aValue - bValue) * dir;
            }

            // Numbers
            if (!isNaN(aValue) && !isNaN(bValue)) {
                return (aValue - bValue) * dir;
            }

            // Strings
            return aValue.toString().localeCompare(bValue.toString()) * dir;
        });

        // Pagination
        const paginatedData = sortedData.slice(start, start + length);

        // Respond in DataTables format
        res.json({
            draw,
            recordsTotal: peripheralsList.length,
            recordsFiltered: filteredData.length,
            data: paginatedData
        });

    } catch (error) {
        console.error("Error fetching peripherals data:", error);
        res.status(500).json({ error: "An error occurred while fetching peripherals data." });
    }
};

exports.addPeripheral = async (req, res) => {
    try {
        const { brand, model, date_of_purchase, peripheral_user, user_dept, kind_of_peripheral, serial_no, property_tag, peripheral_no, peripheral_status, peripheral_location } = req.body;    
        const result = await peripheralModel.addPeripheral(brand, model, date_of_purchase, peripheral_user, user_dept, kind_of_peripheral, serial_no, property_tag, peripheral_no, peripheral_status, peripheral_location);
        res.json({ success: true, message: "Peripheral added successfully" });
    }
    catch (error) {
        console.error("Error adding peripheral:", error);
        res.status(500).json({ error: "An error occurred while adding the peripheral." });
    }   
}