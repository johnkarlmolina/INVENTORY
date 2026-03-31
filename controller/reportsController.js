const { getAccessLevel } = require("../middleware/authMiddleware");

exports.reportsPageRender = async (req, res) => {    
    try {
        const accessLevel = getAccessLevel(req);
        res.render("reports", {
            page: "reports",
            title: "Report Generation",
            baseUrl: process.env.BASE_URL || "",
            accessLevel,
            isAdmin: accessLevel === "Admin",
            isTechnician: accessLevel === "IT Technician"
        });
    } catch (error) {
        console.error("Error rendering reports page:", error);
        res.status(500).send("An error occurred while loading the reports page.");
    }
}
