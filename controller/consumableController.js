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

