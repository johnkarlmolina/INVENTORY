exports.renderUserManagement = async (req, res) => {
    try {
        res.render("user-management", {
            page: "user-management",
            title: "User Management",
        });
    } catch (error) {
        console.error("Error rendering user management page:", error);
        res.status(500).send("An error occurred while loading the user management page.");
    }
};