const { query } = require("../config/db");

exports.computerDataTable = async (req, res) => {
    return query(`select * from main_inventory`)
    
}

exports.addComputer = async (computerData) => {

    const { brand, model, serial_number, property_tag, os_version, procie, ram, os_license, pc_user, user_dept, date_of_purchase, office_license, picture_of_pc, pc_no, pc_status, pc_location } = computerData;
    const sql = `INSERT INTO main_inventory (brand, model, serial_number, property_tag, os_version, procie, ram, os_license, pc_user, user_dept, 
                                              date_of_purchase,  office_license, picture_of_pc, pc_no, pc_status, pc_location) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
    
    const values = [brand, model, serial_number, property_tag, os_version, procie, ram, os_license, pc_user, user_dept, date_of_purchase, office_license, picture_of_pc || null , pc_no || null , pc_status || null, pc_location || null];
    return query(sql, values);
}