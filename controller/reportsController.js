exports.reportsPageRender = async (req, res) => {    
    try {
        res.render("reports", {
            page: "reports",
            title: "Report Generation",
        });
    } catch (error) {
        console.error("Error rendering reports page:", error);
        res.status(500).send("An error occurred while loading the reports page.");
    }
}
