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
        const { item, item_classification, starting_stock, brand, model} = req.body; 
        // Here you would typically insert the data into your database
        console.log("Received consumable data:", { item, item_classification, starting_stock, brand, model});
            await consumableModel.insertConsumables(item, item_classification, starting_stock, brand, model);
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
      model: item.model || ""
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
      "model"
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
