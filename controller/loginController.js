exports.loginPageRender = (req, res) => {
    try {
        res.render("login", { title: "Login" });
    } catch (error) {
        console.error("Error rendering login page:", error);
        res.status(500).send("An error occurred while loading the login page.");
    }
};