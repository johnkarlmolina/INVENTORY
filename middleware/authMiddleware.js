// Middleware to check if user is authenticated
const isAuthenticated = (req, res, next) => {
    if (req.session && req.session.userId) {
        return next();
    }
    res.redirect("/login");
};

function normalizeAccessLevel(accessLevel) {
    const raw = (accessLevel ?? "").toString().trim();
    const normalized = raw.toLowerCase();

    if (normalized === "admin") return "Admin";
    if (normalized === "it technician" || normalized === "it_technician" || normalized === "technician") return "IT Technician";
    if (normalized === "staff") return "IT Technician";

    return raw;
}

function getAccessLevel(req) {
    return normalizeAccessLevel(req?.session?.accessLevel || "");
}

function isAdmin(req) {
    return getAccessLevel(req) === "Admin";
}

function forbidden(req, res) {
    const preferred = req.accepts(["json", "html"]);
    if (preferred === "html") {
        return res.status(403).send("Forbidden");
    }
    return res.status(403).json({ success: false, message: "Forbidden" });
}

function requireAdmin(req, res, next) {
    if (isAdmin(req)) return next();
    return forbidden(req, res);
}

// Middleware to check if user is already logged in (for login page)
const isNotAuthenticated = (req, res, next) => {
    if (req.session && req.session.userId) {
        return res.redirect("/dashboard");
    }
    next();
};

module.exports = {
    isAuthenticated,
    isNotAuthenticated,
    normalizeAccessLevel,
    getAccessLevel,
    isAdmin,
    requireAdmin
};