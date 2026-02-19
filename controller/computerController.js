const computerModel = require("../model/computerModel");

exports.computerDataTable = async (req, res) => {
    try {
        const { draw=1, 
            start=0, 
            length=10, 
            search = {}, 
            order = [{column:0, dir:"asc"}] 
        } = req.body;
        const data = await computerModel.computerDataTable();
        const computerList = [];
        data.forEach((item) => {
            computerList.push({
                computer_id: item.computer_id,
                brand: item.brand,
                model: item.model,
                serial_number: item.serial_number,
                property_tag: item.property_tag,
                os_version: item.os_version,
                procie: item.procie,
                ram: item.ram,
                os_license: item.os_license,
                pc_user: item.pc_user,
                user_dept: item.user_dept,
                date_of_purchase: item.date_of_purchase,
                date_of_entry: item.date_of_entry,
                office_license: item.office_license,
                picture_of_pc: item.picture_of_pc,
                pc_no: item.pc_no,
                pc_status: item.pc_status,
                pc_location: item.pc_location
            });
        });
        const searchValue = (search.value || "").toLowerCase();

        const filteredData = computerList.filter((item) => {
            return Object.values(item).some(value =>
                String(value ?? "")
                    .toLowerCase()
                    .includes(searchValue)
            );
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
            recordsTotal: computerList.length,
            recordsFiltered: filteredData.length,
            data: paginatedData
        });
        //      

       
    } catch (err) {

        console.error(err); 
        res.status(500).json({ error: "DB error" });
    }   
}

exports.addComputer = async (req, res) => {
    try {

        const result = await computerModel.addComputer(req.body);

        if (result && result.affectedRows === 1) {
            res.json({
                success: true,
                message: "Computer added successfully"
            });
        } else {
            res.status(400).json({
                success: false,
                message: "Insert failed"
            });
        }

    } catch (err) {
        console.error(err);
        res.status(500).json({
            success: false,
            message: "Database error"
        });
    }
};