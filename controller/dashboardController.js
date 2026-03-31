const { getAccessLevel } = require("../middleware/authMiddleware");

exports.renderDashboard = async (req, res) => {
    try {
        const accessLevel = getAccessLevel(req);
        res.render("dashboard", {
            baseUrl: process.env.BASE_URL || "",
            accessLevel,
            isAdmin: accessLevel === "Admin",
            isTechnician: accessLevel === "IT Technician"
        });
    } catch (error) {
        console.error("Error rendering dashboard:", error);
        res.status(500).send("Error loading dashboard");
    }
};
