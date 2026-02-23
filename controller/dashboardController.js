exports.renderDashboard = async (req, res) => {
    try {
        res.render("dashboard", {
            baseUrl: process.env.BASE_URL || ""
        });
    } catch (error) {
        console.error("Error rendering dashboard:", error);
        res.status(500).send("Error loading dashboard");
    }
};
