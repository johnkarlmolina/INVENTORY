const { query } = require("../config/db");

const DELETED_STATUS = "inactive_deleted";

exports.peripheralDataTable = async (req, res) => {
    try {
        const peripheralsData = await query(`SELECT * FROM peripherals where COALESCE(LOWER(peripheral_status), '') != ?`, [DELETED_STATUS]);
        return peripheralsData;
    }   
    catch (error) {
        console.error("Error fetching peripherals data:", error);
        throw new Error("An error occurred while fetching peripherals data.");
    }
}

exports.inactivePeripheralDataTable = async () => {
    return query(`SELECT * FROM peripherals WHERE COALESCE(LOWER(peripheral_status), '') = ?`, [DELETED_STATUS]);
}

exports.addPeripheral = async (brand, model, date_of_purchase,  peripheral_user, user_dept, kind_of_peripheral, serial_no, property_tag, peripheral_no, peripheral_status, peripheral_location, computer_id) => { 
    //const { brand, model, date_of_purchase,  peripheral_user, user_dept, kind_of_peripheral, serial_no, property_tag, peripheral_no, peripheral_status, peripheral_location } = peripheralData;
    const normalizedPeripheralStatus = typeof peripheral_status === 'string' ? peripheral_status.trim().toLowerCase() : null;
    const sql = `INSERT INTO peripherals (brand, model, date_of_purchase, peripheral_user, user_dept, kind_of_peripheral, serial_no, property_tag, peripheral_no, peripheral_status, peripheral_location, computer_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;  
    const values = [brand, model, date_of_purchase,  peripheral_user, user_dept, kind_of_peripheral, serial_no, property_tag, peripheral_no, normalizedPeripheralStatus, peripheral_location, computer_id];
    return query(sql, values);
}

exports.updatePeripheral = async (peripheralData) => {
    const {
        peripheral_id,
        brand,
        model,
        date_of_purchase,
        peripheral_user,
        user_dept,
        kind_of_peripheral,
        serial_no,
        property_tag,
        peripheral_no,
        peripheral_status,
        peripheral_location,
        computer_id
    } = peripheralData;

    const normalizedPeripheralStatus = typeof peripheral_status === 'string' ? peripheral_status.trim().toLowerCase() : null;

    const sql = `UPDATE peripherals
                 SET brand = ?,
                     model = ?,
                     date_of_purchase = ?,
                     peripheral_user = ?,
                     user_dept = ?,
                     kind_of_peripheral = ?,
                     serial_no = ?,
                     property_tag = ?,
                     peripheral_no = ?,
                     peripheral_status = ?,
                     peripheral_location = ?,
                     computer_id = ?
                 WHERE peripheral_id = ?`;

    const values = [
        brand || null,
        model || null,
        date_of_purchase || null,
        peripheral_user || null,
        user_dept || null,
        kind_of_peripheral || null,
        serial_no || null,
        property_tag || null,
        peripheral_no || null,
        normalizedPeripheralStatus,
        peripheral_location || null,
        computer_id || null,
        peripheral_id
    ];

    return query(sql, values);
}

exports.deletePeripheral = async (peripheral_id) => {
    const sql = `update peripherals set peripheral_status = ? WHERE peripheral_id = ?`;
    return query(sql, [DELETED_STATUS, peripheral_id]);
}

exports.activatePeripheral = async (peripheral_id) => {
    const sql = `update peripherals set peripheral_status = ? WHERE peripheral_id = ?`;
    return query(sql, ['active', peripheral_id]);
}
