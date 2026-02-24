const { query } = require("../config/db");

exports.insertConsumables = async (item, item_classification, starting_stock, brand, model) => {
    const sql = `INSERT INTO main_consumables (item, item_classification, starting_stock, brand, model) VALUES (?, ?, ?, ?, ?)`;  
    const values = [item, item_classification, starting_stock, brand, model];
    return query(sql, values);
}