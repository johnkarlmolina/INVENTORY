const { query } = require("../config/db");

exports.insertConsumables = async (item, item_classification, starting_stock, brand, model, batch_number) => {
    const sql = `INSERT INTO main_consumables (item, item_classification, starting_stock, brand, model, batch_number) VALUES (?, ?, ?, ?, ?, ?)`;  
    const values = [item, item_classification, starting_stock, brand, model, batch_number];
    return query(sql, values);
}

exports.showConsumables = async () => {
    const sql = `SELECT * FROM main_consumables`;
    return query(sql);
}

exports.recordRequest = async (item, status, transaction_date, issued_quantity, item_classification, brand, model, stock_no, batch_number) => {
    const sql = `INSERT INTO consumable_requests (item, status, transaction_date, issued_quantity, item_classification, brand, model, stock_no, batch_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`;
    const values = [item, status, transaction_date, issued_quantity, item_classification, brand, model, stock_no, batch_number];
    return query(sql, values);
}
   