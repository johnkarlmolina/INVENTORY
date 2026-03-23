const { query } = require("../config/db");

exports.userDataTable = async () => {
    return query(`SELECT user_no, fname, department, uname, upassword, access_lvl FROM users where user_stats = ? ORDER BY user_no DESC`, ['active']);
};

exports.inactiveUserDataTable = async () => {
    return query(`SELECT user_no, fname, uname FROM users WHERE user_stats = ? ORDER BY user_no DESC`, ['inactive']);
};

exports.addUser = async (full_name, department, username, password, access_level) => {
    const sql = `INSERT INTO users (fname, department, uname, upassword, access_lvl, user_stats) VALUES (?, ?, ?, ?, ?, ?)`;
    const values = [full_name, department, username, password, access_level, 'active'];
    return query(sql, values);
};

exports.updateUser = async (user_no, full_name, department, username, password, access_level) => {
    const sql = `UPDATE users SET fname = ?, department = ?, uname = ?, upassword = ?, access_lvl = ? WHERE user_no = ?`;
    const values = [full_name, department, username, password, access_level, user_no];
    return query(sql, values);
};

exports.deleteUser = async (user_no) => {
    return query(`update users set user_stats =? WHERE user_no = ?`, ['inactive', user_no]);
};

exports.activateUser = async (user_no) => {
    return query(`update users set user_stats = ? WHERE user_no = ?`, ['active', user_no]);
};
