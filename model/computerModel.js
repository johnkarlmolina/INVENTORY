const { query } = require("../config/db");

const DELETED_STATUS = "inactive_deleted";

exports.computerDataTable = async (req, res) => {
    return query(`select * from main_inventory where COALESCE(LOWER(pc_status), '') != ?`, [DELETED_STATUS]);
    
}

exports.inactiveComputerDataTable = async () => {
    return query(`select * from main_inventory where COALESCE(LOWER(pc_status), '') = ?`, [DELETED_STATUS]);
}

exports.addComputer = async (computerData) => {

    const { brand, model, serial_number, property_tag, os_version, procie, ram, os_license, pc_user, user_dept, date_of_purchase, office_license, picture_of_pc, pc_no, pc_status, pc_location } = computerData;
    const normalizedPcStatus = typeof pc_status === 'string' ? pc_status.trim().toLowerCase() : null;
    const sql = `INSERT INTO main_inventory (brand, model, serial_number, property_tag, os_version, procie, ram, os_license, pc_user, user_dept, 
                                              date_of_purchase,  office_license, picture_of_pc, pc_no, pc_status, pc_location) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
    
    const values = [brand, model, serial_number, property_tag, os_version, procie, ram, os_license, pc_user, user_dept, date_of_purchase, office_license, picture_of_pc || null , pc_no || null , normalizedPcStatus, pc_location || null];
    return query(sql, values);
}

exports.updateComputer = async (computerData) => {
    const {
        computer_id,
        brand,
        model,
        serial_number,
        property_tag,
        os_version,
        procie,
        ram,
        os_license,
        pc_user,
        user_dept,
        date_of_purchase,
        date_of_entry,
        office_license,
        picture_of_pc,
        pc_no,
        pc_status,
        pc_location
    } = computerData;
    const normalizedPcStatus = typeof pc_status === 'string' ? pc_status.trim().toLowerCase() : null;

    const sql = `UPDATE main_inventory
                 SET brand = ?,
                     model = ?,
                     serial_number = ?,
                     property_tag = ?,
                     os_version = ?,
                     procie = ?,
                     ram = ?,
                     os_license = ?,
                     pc_user = ?,
                     user_dept = ?,
                     date_of_purchase = ?,
                     date_of_entry = ?,
                     office_license = ?,
                     picture_of_pc = COALESCE(?, picture_of_pc),
                     pc_no = ?,
                     pc_status = ?,
                     pc_location = ?
                 WHERE computer_id = ?`;

    const values = [
        brand || null,
        model || null,
        serial_number || null,
        property_tag || null,
        os_version || null,
        procie || null,
        ram || null,
        os_license || null,
        pc_user || null,
        user_dept || null,
        date_of_purchase || null,
        date_of_entry || null,
        office_license || null,
        picture_of_pc || null,
        pc_no || null,
        normalizedPcStatus,
        pc_location || null,
        computer_id
    ];

    return query(sql, values);
}

exports.getComputerIds = async()=>{
    return query("select computer_id, brand, model, serial_number from main_inventory")
}

exports.deleteComputer = async (computer_id) => {
    return query(`update main_inventory set pc_status = ? WHERE computer_id = ?`, [DELETED_STATUS, computer_id]);
}

exports.activateComputer = async (computer_id) => {
    return query(`update main_inventory set pc_status = ? WHERE computer_id = ?`, ['active', computer_id]);
}

exports.updateComputerPicture = async (computer_id, picture_of_pc) => {
	return query(`update main_inventory set picture_of_pc = ? WHERE computer_id = ?`, [picture_of_pc || null, computer_id]);
}