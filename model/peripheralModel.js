const { query } = require("../config/db");

exports.peripheralDataTable = async (req, res) => {
    try {
        const peripheralsData = await query(`SELECT * FROM peripherals where peripheral_status != ?`, ['inactive']);
        return peripheralsData;
    }   
    catch (error) {
        console.error("Error fetching peripherals data:", error);
        throw new Error("An error occurred while fetching peripherals data.");
    }
}

exports.addPeripheral = async (brand, model, date_of_purchase,  peripheral_user, user_dept, kind_of_peripheral, serial_no, property_tag, peripheral_no, peripheral_status, peripheral_location, computer_id) => { 
    //const { brand, model, date_of_purchase,  peripheral_user, user_dept, kind_of_peripheral, serial_no, property_tag, peripheral_no, peripheral_status, peripheral_location } = peripheralData;
    const sql = `INSERT INTO peripherals (brand, model, date_of_purchase, peripheral_user, user_dept, kind_of_peripheral, serial_no, property_tag, peripheral_no, peripheral_status, peripheral_location, computer_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;  
    const values = [brand, model, date_of_purchase,  peripheral_user, user_dept, kind_of_peripheral, serial_no, property_tag, peripheral_no, peripheral_status, peripheral_location, computer_id];
    return query(sql, values);
}

exports.deletePeripheral = async (peripheral_id) => {
    const sql = `update peripherals set peripheral_status = ? WHERE peripheral_id = ?`;
    return query(sql, ['inactive', peripheral_id]);
}
