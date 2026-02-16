exports.servicesPageRender = async (req, res) => {    
    try {
        res.render("services", {
            page: "services",
            title: "Computer Services",
        });
    } catch (error) {
        console.error("Error rendering services page:", error);
        res.status(500).send("An error occurred while loading the services page.");
    }
}

