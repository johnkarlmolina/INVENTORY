const { query } = require("../config/db");

exports.userDataTable = async () => {
    return query(`SELECT user_no, fname, department, uname, upassword, access_lvl FROM users ORDER BY user_no DESC`);
};

exports.addUser = async (full_name, department, username, password, access_level) => {
    const sql = `INSERT INTO users (fname, department, uname, upassword, access_lvl) VALUES (?, ?, ?, ?, ?)`;
    const values = [full_name, department, username, password, access_level];
    return query(sql, values);
};

exports.updateUser = async (user_no, full_name, department, username, password, access_level) => {
    const sql = `UPDATE users SET fname = ?, department = ?, uname = ?, upassword = ?, access_lvl = ? WHERE user_no = ?`;
    const values = [full_name, department, username, password, access_level, user_no];
    return query(sql, values);
};

exports.deleteUser = async (user_no) => {
    return query(`DELETE FROM users WHERE user_no = ?`, [user_no]);
};
