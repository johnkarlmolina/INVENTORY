const loginModel = require("../model/loginModel");
const { normalizeAccessLevel } = require("../middleware/authMiddleware");
const bcrypt = require("bcryptjs");

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
        const username = typeof req.body?.username === 'string' ? req.body.username.trim() : req.body?.username;
        const password = req.body?.password;

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

        const storedPassword = user.password;
        const isBcryptHash = typeof storedPassword === 'string' && /^\$2[aby]\$\d\d\$/.test(storedPassword);

        let passwordOk = false;
        if (isBcryptHash) {
            passwordOk = await bcrypt.compare(String(password), storedPassword);
        } else {
            passwordOk = String(password) === String(storedPassword);
        }

        if (!passwordOk) {
            return res.status(401).json({ 
                success: false, 
                message: "Invalid username or password" 
            });
        }

        // Upgrade legacy plaintext passwords to bcrypt on successful login
        if (!isBcryptHash) {
            try {
                const hashedPassword = await bcrypt.hash(String(password), 10);
                await loginModel.updateUserPassword(user.id, hashedPassword);
            } catch (e) {
                console.warn('Password upgrade failed for user:', user?.id, e);
            }
        }

        // Set session
        req.session.userId = user.id;
        req.session.username = user.username;
        req.session.accessLevel = normalizeAccessLevel(user.access_lvl);

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
