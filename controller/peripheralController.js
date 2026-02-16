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
        const { draw=1, 
            start=0, 
            length=10, 
            search = {}, 
            order = [{column:0, dir:"asc"}] 
        } = req.body;

        const peripheralsData = await peripheralModel.peripheralDataTable();

        const peripheralsList = [];

        peripheralsData.forEach((item) => {
            peripheralsList.push({
                peripheral_id: item.peripheral_id,  
                brand: item.brand,
                model: item.model,
                date_of_purchase: item.date_of_purchase,
                date_of_entry: item.date_of_entry,
                peripheral_user: item.peripheral_user,
                user_dept: item.user_dept,
                kind_of_peripheral: item.kind_of_peripheral,
                serial_no: item.serial_no,
                property_tag: item.property_tag,
                peripheral_no: item.peripheral_no,
                peripheral_status: item.peripheral_status,
                peripheral_location: item.peripheral_location
            });
        });
        const searchValue = search.value || "";
        const filteredData = peripheralsList.filter((item) => {
            return (item.brand.toLowerCase().includes(searchValue.toLowerCase()) ||

                    item.model.toLowerCase().includes(searchValue.toLowerCase()) ||
                    item.date_of_purchase.toLowerCase().includes(searchValue.toLowerCase()) ||
                    item.date_of_entry.toLowerCase().includes(searchValue.toLowerCase()) ||     
                    item.peripheral_user.toLowerCase().includes(searchValue.toLowerCase()) ||
                    item.user_dept.toLowerCase().includes(searchValue.toLowerCase()) ||
                    item.kind_of_peripheral.toLowerCase().includes(searchValue.toLowerCase()) ||
                    item.serial_no.toLowerCase().includes(searchValue.toLowerCase()) ||
                    item.property_tag.toLowerCase().includes(searchValue.toLowerCase()) ||
                    item.peripheral_no.toLowerCase().includes(searchValue.toLowerCase()) ||
                    item.peripheral_status.toLowerCase().includes(searchValue.toLowerCase()) ||
                    item.peripheral_location.toLowerCase().includes(searchValue.toLowerCase()));
        });
        const sortedData = filteredData.sort((a, b) => {
            const columnIndex = order[0].column;
            const dir = order[0].dir === "asc" ? 1 : -1;
            const aValue = Object.values(a)[columnIndex];
            const bValue = Object.values(b)[columnIndex];
            if (aValue < bValue) return -1 * dir;
            if (aValue > bValue) return 1 * dir;
            return 0;
        });

        const paginatedData = sortedData.slice(start, start + length);

        res.json({
            draw,
            recordsTotal: peripheralsList.length,
            recordsFiltered: filteredData.length,
            data: paginatedData
        });
        
        
    }

    catch (error) {
        console.error("Error fetching peripherals data:", error);
        res.status(500).json({ error: "An error occurred while fetching peripherals data." });
    }
}