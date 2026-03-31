const { getAccessLevel } = require("../middleware/authMiddleware");

exports.inventoryPageRender = async (req, res) => {
    try {
        const accessLevel = getAccessLevel(req);
        res.render("inventory", {
            page: "inventory",
            title: "Computer Inventory",
            baseUrl: process.env.BASE_URL || "",
            accessLevel,
            isAdmin: accessLevel === "Admin",
            isTechnician: accessLevel === "IT Technician"
        });
    } catch (error) {
        console.error("Error rendering inventory page:", error);
        res.status(500).send("An error occurred while loading the inventory page.");
    }
};
