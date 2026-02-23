exports.inventoryPageRender = async (req, res) => {
    try {
        res.render("inventory", {
            page: "inventory",
            title: "Computer Inventory",
            baseUrl: process.env.BASE_URL || ""
        });
    } catch (error) {
        console.error("Error rendering inventory page:", error);
        res.status(500).send("An error occurred while loading the inventory page.");
    }
};
