const consumableModel = require("../model/consumableModel");
exports.consumablePageRender = async (req, res) => {    
    try {
        res.render("consumable", {
            page: "consumable",
            title: "Consumable Inventory",
        });
    } catch (error) {
        console.error("Error rendering consumable page:", error);
        res.status(500).send("An error occurred while loading the consumable page.");
    }
}
exports.insertConsumables = async (req, res) => {
    try {
        const { item, item_classification, starting_stock, brand, model, batch_number} = req.body; 
        // Here you would typically insert the data into your database
        console.log("Received consumable data:", { item, item_classification, starting_stock, brand, model, batch_number});
            await consumableModel.insertConsumables(item, item_classification, starting_stock, brand, model, batch_number);
        // Simulate successful insertion
        res.status(200).json({ message: "Consumable item inserted successfully" });
    }   
    catch (error) {
        console.error("Error inserting consumable item:", error);
        res.status(500).json({ message: "An error occurred while inserting the consumable item." });
    }   
}

exports.showConsumables = async (req, res) => {
  try {
    const {
      draw = 1,
      start = 0,
      length = 10,
      search = { value: "" },
      order = [{ column: 0, dir: "asc" }]
    } = req.body;

    // Fetch data from database
    const consumables = await consumableModel.showConsumables();

    // Map DB results safely
    const consumableList = consumables.map(item => ({
      item: item.item,
      item_classification: item.item_classification || "",
      current_stock: item.current_stock || 0,
      stock_no: item.stock_no || 0,
      date_of_entry: item.date_of_entry ,
      date_of_purchase:item.date_of_purchase,
      brand: item.brand || "",
      model: item.model || "",
      batch_number: item.batch_number || ""
    }));

    // Total records BEFORE filtering
    const recordsTotal = consumableList.length;

    // SEARCH FILTER
    const searchValue = (search.value || "").toLowerCase();

    let filteredConsumables = consumableList.filter(item =>
      item.item.toLowerCase().includes(searchValue) ||
      item.item_classification.toLowerCase().includes(searchValue) ||
      item.brand.toLowerCase().includes(searchValue) ||
      item.model.toLowerCase().includes(searchValue)
    );

    // Total records AFTER filtering
    const recordsFiltered = filteredConsumables.length;

    // ORDERING (only use columns that exist)
    const columns = [
      "item",
      "item_classification",
      "current_stock", 
      "stock_no",// Assuming you have this field in your DB
      "date_of_entry",
      "date_of_purchase",
      "brand",
      "model",
      "batch_number"
    ];

    const columnIndex = order[0]?.column ?? 0;
    const columnName = columns[columnIndex];
    const dir = order[0]?.dir === "desc" ? "desc" : "asc";

    if (columnName) {
      filteredConsumables.sort((a, b) => {
        const aValue = a[columnName];
        const bValue = b[columnName];

        if (aValue < bValue) return dir === "asc" ? -1 : 1;
        if (aValue > bValue) return dir === "asc" ? 1 : -1;
        return 0;
      });
    }

    // PAGINATION
    const startNum = parseInt(start);
    const lengthNum = parseInt(length);

    const data = filteredConsumables.slice(startNum, startNum + lengthNum);

    // RESPONSE (DataTables format)
    res.json({
      draw: parseInt(draw),
      recordsTotal,
      recordsFiltered,
      data
    });

  } catch (error) {
    console.error("Error fetching consumable items:", error);
    res.status(500).json({
      message: "An error occurred while fetching the consumable items."
    });
  }
};

exports.recordRequest = async (req, res) => {
  try {
    const { items } = req.body;
    console.log("Received request items:", items);

    for (const request of items) {

      console.log("Saving request:", request);

      await consumableModel.recordRequest(
        request.item,
        request.transaction_date,
        request.issued_quantity,
        request.item_classification,
        request.stock_no,
        request.batch_number,
        request.issued_to
      );

      const currentStock = await consumableModel.getStockByItem(request.stock_no);

      const newStock = currentStock - request.issued_quantity;

      await consumableModel.updateMainConsumableStock(request.stock_no, newStock);


    }

    res.status(200).json({ message: "Consumable request recorded successfully" });

  } catch (error) {
    console.error("Error recording consumable request:", error);
    res.status(500).json({
      message: "An error occurred while recording the consumable request."
    });
  }
};

exports.getConsumableLogs = async (req, res) => {
  try {
    const {
      draw = 1,
      start = 0,
      length = 10,
      search = { value: "" },
      order = [{ column: 0, dir: "desc" }]
    } = req.body;

    // Fetch logs from database
    const logs = await consumableModel.getConsumableLogs();

    // Map DB results
    const logsList = logs.map(log => ({
      item: log.item || "",
      transact_date: log.transact_date || "",
      issued_quantity: log.issued_quantity || 0,
      item_class: log.item_class || "",
      stock_no: log.stock_no || "",
      batch_number: log.batch_number || "",
      issued_to: log.issued_to || "",
      consumable_no: log.consumable_no || 0
    }));

    // Total records BEFORE filtering
    const recordsTotal = logsList.length;

    // SEARCH FILTER
    const searchValue = (search.value || "").toLowerCase();

    let filteredLogs = logsList.filter(log =>
      log.item.toLowerCase().includes(searchValue) ||
      log.item_class.toLowerCase().includes(searchValue) ||
      log.issued_to.toLowerCase().includes(searchValue) ||
      log.stock_no.toString().includes(searchValue)||
      log.batch_number.toLowerCase().includes(searchValue)||
      log.transact_date.toString().toLowerCase().includes(searchValue)||
      log.consumable_no.toString().includes(searchValue)
    );

    // Total records AFTER filtering
    const recordsFiltered = filteredLogs.length;

    // ORDERING
    const columns = [
      "item",
      "transact_date",
      "issued_quantity",
      "item_class",
      "stock_no",
      "batch_number",
      "issued_to",
      "consumable_no"
    ];

    const columnIndex = order[0]?.column ?? 0;
    const columnName = columns[columnIndex];
    const dir = order[0]?.dir === "desc" ? "desc" : "asc";

    if (columnName) {
      filteredLogs.sort((a, b) => {
        const aValue = a[columnName];
        const bValue = b[columnName];

        if (aValue < bValue) return dir === "asc" ? -1 : 1;
        if (aValue > bValue) return dir === "asc" ? 1 : -1;
        return 0;
      });
    }

    // PAGINATION
    const startNum = parseInt(start);
    const lengthNum = parseInt(length);

    const data = filteredLogs.slice(startNum, startNum + lengthNum);

    // RESPONSE (DataTables format)
    res.json({
      draw: parseInt(draw),
      recordsTotal,
      recordsFiltered,
      data
    });

  } catch (error) {
    console.error("Error fetching consumable logs:", error);
    res.status(500).json({
      message: "An error occurred while fetching the consumable logs."
    });
  }
};

exports.undoTransaction = async (req, res) => {
  try {
    const { id } = req.body; 
    console.log("Received log ID for undo:", id);
    const item_stats = "UNDO"

    const consumableLogs = await consumableModel.getConsumableLogsById(id);

    if (consumableLogs.length === 0) {
      return res.status(404).json({ message: "Transaction log not found." });
    }
    const log = consumableLogs[0];
    await consumableModel.updateMainConsumableStock(log.stock_no, log.issued_quantity);

    await consumableModel.insertIntoUndoLogs(
          log.item,
          log.issued_quantity,
          log.item_class,
          log.stock_no,
          log.batch_number,
          log.issued_to,
          log.consumable_no,
          item_stats
          
        );

    await consumableModel.deleteConsumableLog(id);

    res.status(200).json({ message: "Transaction undone successfully." });
  } catch (error) {
    console.error("Error undoing transaction:", error);
    res.status(500).json({ message: "An error occurred while undoing the transaction." });
  }   
}
