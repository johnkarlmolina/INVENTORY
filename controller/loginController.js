const loginModel = require("../model/loginModel");

// Render login page
exports.loginPageRender = (req, res) => {
    try {
        // If already logged in, redirect to dashboard
        if (req.session && req.session.userId) {
            return res.redirect("/dashboard");
        }
        res.render("login", { title: "Login", error: null });
    } catch (error) {
        console.error("Error rendering login page:", error);
        res.status(500).send("An error occurred while loading the login page.");
    }
};

// Handle login submission
exports.loginSubmit = async (req, res) => {
    try {
        const { username, password } = req.body;

        // Validate input
        if (!username || !password) {
            return res.status(400).json({ 
                success: false, 
                message: "Username and password are required" 
            });
        }

        // Get user from database
        const user = await loginModel.getUserByUsername(username);

        if (!user) {
            return res.status(401).json({ 
                success: false, 
                message: "Invalid username or password" 
            });
        }

        // Compare password (plain text - for production, use bcrypt)
        if (password !== user.password) {
            return res.status(401).json({ 
                success: false, 
                message: "Invalid username or password" 
            });
        }

        // Set session
        req.session.userId = user.id;
        req.session.username = user.username;

        // Send success response
        res.json({ 
            success: true, 
            message: "Login successful",
            redirect: "/dashboard"
        });

    } catch (error) {
        console.error("Error in login:", error);
        res.status(500).json({ 
            success: false, 
            message: "An error occurred during login" 
        });
    }
};

// Handle logout
exports.logout = (req, res) => {
    try {
        req.session.destroy((err) => {
            if (err) {
                console.error("Error destroying session:", err);
                return res.status(500).json({ 
                    success: false, 
                    message: "Error logging out" 
                });
            }
            res.redirect("/login");
        });
    } catch (error) {
        console.error("Error in logout:", error);
        res.status(500).json({ 
            success: false, 
            message: "An error occurred during logout" 
        });
    }
};
