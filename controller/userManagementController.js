const userModel = require("../model/userManagement");
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

exports.addUser = async (req, res) => {
    try {
        const { full_name, username, password, access_level, department } = req.body;      
        // Here you would typically add code to save the new user to your database
        // For example:
        // await userModel.createUser(username, password, role, department);    
        await userModel.addUser(full_name, department, username, password, access_level);
        res.status(200).json({ message: "User added successfully" });
    }
    catch (error) {
        console.error("Error adding user:", error);
        res.status(500).json({ message: "An error occurred while adding the user." });
    }
};