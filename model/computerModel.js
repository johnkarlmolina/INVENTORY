const { query } = require("../config/db");

exports.computerDataTable = async (req, res) => {
    return query(`select * from main_inventory`)
    
}