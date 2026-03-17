const { query } = require("../config/db");

exports.addUser = async (full_name, department, username, password, access_level) => {
    const sql = `INSERT INTO users (fname, department, uname, upassword, access_lvl) VALUES (?, ?, ?, ?, ?)`;
    const values = [full_name, department, username, password, access_level];
    return query(sql, values);
}   
