// Middleware to check if user is authenticated
const isAuthenticated = (req, res, next) => {
    if (req.session && req.session.userId) {
        return next();
    }
    res.redirect("/login");
};

// Middleware to check if user is already logged in (for login page)
const isNotAuthenticated = (req, res, next) => {
    if (req.session && req.session.userId) {
        return res.redirect("/dashboard");
    }
    next();
};

module.exports = {
    isAuthenticated,
    isNotAuthenticated
};
