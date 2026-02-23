const { query } = require("../config/db");

exports.inventoryDataTable = async () => {
    return query(`SELECT * FROM main_inventory`);
}

exports.addInventoryItem = async (inventoryData) => {
    const { 
        brand, model, serial_number, property_tag, os_version, 
        procie, ram, os_license, pc_user, user_dept, 
        date_of_purchase, office_license, picture_of_pc, 
        pc_no, pc_status, pc_location 
    } = inventoryData;
    
    const sql = `INSERT INTO main_inventory 
        (brand, model, serial_number, property_tag, os_version, procie, ram, 
         os_license, pc_user, user_dept, date_of_purchase, office_license, 
         picture_of_pc, pc_no, pc_status, pc_location) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
    
    const values = [
        brand, model, serial_number, property_tag, os_version, 
        procie, ram, os_license, pc_user, user_dept, 
        date_of_purchase, office_license, picture_of_pc || null, 
        pc_no || null, pc_status || null, pc_location || null
    ];
    
    return query(sql, values);
}

exports.updateInventoryItem = async (inventoryData) => {
    const { 
        computer_id, brand, model, serial_number, property_tag, os_version, 
        procie, ram, os_license, pc_user, user_dept, 
        date_of_purchase, office_license, picture_of_pc, 
        pc_no, pc_status, pc_location 
    } = inventoryData;
    
    const sql = `UPDATE main_inventory SET 
        brand = ?, model = ?, serial_number = ?, property_tag = ?, 
        os_version = ?, procie = ?, ram = ?, os_license = ?, 
        pc_user = ?, user_dept = ?, date_of_purchase = ?, 
        office_license = ?, picture_of_pc = ?, pc_no = ?, 
        pc_status = ?, pc_location = ?
        WHERE computer_id = ?`;
    
    const values = [
        brand, model, serial_number, property_tag, os_version, 
        procie, ram, os_license, pc_user, user_dept, 
        date_of_purchase, office_license, picture_of_pc || null, 
        pc_no || null, pc_status || null, pc_location || null,
        computer_id
    ];
    
    return query(sql, values);
}

exports.deleteInventoryItem = async (id) => {
    const sql = `DELETE FROM main_inventory WHERE computer_id = ?`;
    return query(sql, [id]);
}
