exports.maintenancePageRender = async (req, res) => {    
    try {
        res.render("maintenance", {
            page: "maintenance",
            title: "Preventive Maintenance",
        });
    } catch (error) {
        console.error("Error rendering maintenance page:", error);
        res.status(500).send("An error occurred while loading the maintenance page.");
    }
}

