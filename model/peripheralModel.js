const { query } = require("../config/db");

exports.peripheralDataTable = async (req, res) => {
    try {
        const peripheralsData = await query(`SELECT * FROM peripherals`);
        return peripheralsData;
    }   
    catch (error) {
        console.error("Error fetching peripherals data:", error);
        throw new Error("An error occurred while fetching peripherals data.");
    }
}

exports.addPeripheral = async (brand, model, date_of_purchase, date_of_entry, peripheral_user, user_dept, kind_of_peripheral, serial_no, property_tag, peripheral_no, peripheral_status, peripheral_location) => { 
    //const { brand, model, date_of_purchase, date_of_entry, peripheral_user, user_dept, kind_of_peripheral, serial_no, property_tag, peripheral_no, peripheral_status, peripheral_location } = peripheralData;
    const sql = `INSERT INTO peripherals (brand, model, date_of_purchase, date_of_entry, peripheral_user, user_dept, kind_of_peripheral, serial_no, property_tag, peripheral_no, peripheral_status, peripheral_location) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;  
    const values = [brand, model, date_of_purchase, date_of_entry, peripheral_user, user_dept, kind_of_peripheral, serial_no, property_tag, peripheral_no, peripheral_status, peripheral_location];
    return query(sql, values);
}   
