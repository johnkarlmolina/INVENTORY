const { query } = require("../config/db");

exports.insertConsumables = async (item, item_classification, starting_stock, brand, model, batch_number) => {
    const sql = `INSERT INTO main_consumables (item, item_classification, starting_stock, brand, model, batch_number, current_stock) VALUES (?, ?, ?, ?, ?, ?, ?)`;  
    const values = [item, item_classification, starting_stock, brand, model, batch_number, starting_stock];
    return query(sql, values);
}

exports.showConsumables = async () => {
    const sql = `SELECT * FROM main_consumables`;
    return query(sql);
}

exports.recordRequest = async (item, transaction_date, issued_quantity, item_classification, stock_no, batch_number, issued_to) => {
    const sql = `INSERT INTO consumable_logs (item, date_input, issued_quantity, item_class, stock_no, batch_number, issued_to) VALUES (?, ?, ?, ?, ?, ?, ?)`;
    const values = [item, transaction_date, issued_quantity, item_classification, stock_no, batch_number, issued_to];
    return query(sql, values);
}

exports.getStockByItem = async (item) => {
    const sql = `SELECT current_stock FROM main_consumables WHERE stock_no = ?`;
    const values = [item];
    const result = await query(sql, values);
    return result.length > 0 ? result[0].current_stock : null;
}

exports.updateMainConsumableStock = async (item, newStock) => {
    const sql = `UPDATE main_consumables SET current_stock = ? WHERE stock_no = ?`;
    const values = [newStock, item];
    return query(sql, values);
}

exports.getConsumableLogs = async () => {
    const sql = `SELECT * FROM consumable_logs`;
    return query(sql);
}

exports.getConsumableLogsById = async (consumable_no) => {

    const sql = `SELECT * FROM consumable_logs WHERE consumable_no  = ? ORDER BY transact_date DESC`;
    const values = [consumable_no];
    return query(sql, values);

}  

exports.updateMainConsumableStock = async (stock_no, newStock) => {
    const sql = `UPDATE main_consumables SET current_stock = current_stock + ? WHERE stock_no = ?`;
    const values = [newStock, stock_no];
    return query(sql, values);
}

exports.insertIntoUndoLogs = async (
  item,
  issued_quantity,
  item_classification,
  stock_no,
  batch_number,
  issued_to,
  consumable_no,
  item_status
) => {
  const sql = `
    INSERT INTO consumable_logs_statuses 
    (item, issued_quantity, item_classification, stock_no, batch_number, issued_to, consumable_no, item_status) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
  `;

  const values = [
    item,
    issued_quantity,
    item_classification,
    stock_no,
    batch_number,
    issued_to,
    consumable_no,
    item_status
  ];
  

  return query(sql, values);
};

exports.deleteConsumableLog = async (consumable_no) => {
  const sql = `DELETE FROM consumable_logs WHERE consumable_no = ?`;
  const values = [consumable_no];
  return query(sql, values);
}