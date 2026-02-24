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
