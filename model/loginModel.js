const { query } = require("../config/db");

// Get user by username
const getUserByUsername = async (username) => {
    try {
        const sql = "SELECT * FROM login WHERE username = ?";
        const result = await query(sql, [username]);
        return result[0] || null;
    } catch (error) {
        console.error("Error in getUserByUsername:", error);
        throw error;
    }
};

// Get user by ID
const getUserById = async (id) => {
    try {
        const sql = "SELECT * FROM login WHERE id = ?";
        const result = await query(sql, [id]);
        return result[0] || null;
    } catch (error) {
        console.error("Error in getUserById:", error);
        throw error;
    }
};

module.exports = {
    getUserByUsername,
    getUserById
};
