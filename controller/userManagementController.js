const userModel = require("../model/userManagement");
exports.renderUserManagement = async (req, res) => {
    try {
        res.render("user-management", {
            page: "user-management",
            title: "User Management",
            baseUrl: process.env.BASE_URL || ""
        });
    } catch (error) {
        console.error("Error rendering user management page:", error);
        res.status(500).send("An error occurred while loading the user management page.");
    }
};

exports.userDataTable = async (req, res) => {
    try {
        const {
            draw = 1,
            start = 0,
            length = 10,
            search = {},
            order = [{ column: 0, dir: "asc" }]
        } = req.body;

        const parsedStart = Number(start) || 0;
        const parsedLength = Number(length) || 10;

        const data = await userModel.userDataTable();
        const userList = data.map((item) => ({
            user_no: item.user_no,
            fname: item.fname,
            department: item.department,
            uname: item.uname,
            upassword: item.upassword,
            access_lvl: item.access_lvl
        }));

        const searchValue = String(search.value || "").toLowerCase();
        const filteredData = userList.filter((item) => {
            return Object.values(item).some((value) =>
                String(value ?? "").toLowerCase().includes(searchValue)
            );
        });

        const sortableColumns = ["user_no", "fname", "department", "uname", "upassword", "access_lvl"];
        const orderColumn = Number(order[0].column) || 0;
        const orderDirection = order[0].dir === "desc" ? -1 : 1;
        const sortKey = sortableColumns[orderColumn] || "user_no";

        const sortedData = filteredData.sort((a, b) => {
            const aValue = a[sortKey];
            const bValue = b[sortKey];
            if (aValue < bValue) return -1 * orderDirection;
            if (aValue > bValue) return 1 * orderDirection;
            return 0;
        });

        const paginatedData = sortedData.slice(parsedStart, parsedStart + parsedLength);

        res.json({
            draw: Number(draw) || 1,
            recordsTotal: userList.length,
            recordsFiltered: filteredData.length,
            data: paginatedData
        });
    } catch (error) {
        console.error("Error loading user DataTable:", error);
        res.status(500).json({ error: "DB error" });
    }
};

exports.addUser = async (req, res) => {
    try {
        const { full_name, username, password, access_level, department } = req.body;      
        await userModel.addUser(full_name, department, username, password, access_level);
        res.status(200).json({ success: true, message: "User added successfully" });
    }
    catch (error) {
        console.error("Error adding user:", error);
        res.status(500).json({ success: false, message: "An error occurred while adding the user." });
    }
};

exports.updateUser = async (req, res) => {
    try {
        const { user_no, full_name, username, password, access_level, department } = req.body;

        if (!user_no) {
            return res.status(400).json({ success: false, message: "User ID is required." });
        }

        const result = await userModel.updateUser(user_no, full_name, department, username, password, access_level);

        if (result && result.affectedRows === 1) {
            return res.status(200).json({ success: true, message: "User updated successfully" });
        }

        res.status(404).json({ success: false, message: "User not found." });
    } catch (error) {
        console.error("Error updating user:", error);
        res.status(500).json({ success: false, message: "An error occurred while updating the user." });
    }
};

exports.deleteUser = async (req, res) => {
    try {
        const { user_no } = req.body;

        if (!user_no) {
            return res.status(400).json({ success: false, message: "User ID is required." });
        }

        const result = await userModel.deleteUser(user_no);

        if (result && result.affectedRows === 1) {
            return res.status(200).json({ success: true, message: "User deleted successfully" });
        }

        res.status(404).json({ success: false, message: "User not found." });
    } catch (error) {
        console.error("Error deleting user:", error);
        res.status(500).json({ success: false, message: "An error occurred while deleting the user." });
    }
};

exports.inactiveUserDataTable = async (req, res) => {
    try {
        const {
            draw = 1,
            start = 0,
            length = 10,
            search = {},
            order = [{ column: 0, dir: "asc" }]
        } = req.body;

        const parsedStart = Number(start) || 0;
        const parsedLength = Number(length) || 10;

        const data = await userModel.inactiveUserDataTable();
        const userList = data.map((item) => ({
            user_no: item.user_no,
            fname: item.fname || "",
            uname: item.uname || ""
        }));

        const searchValue = String(search.value || "").toLowerCase();
        const filteredData = userList.filter((item) =>
            item.fname.toLowerCase().includes(searchValue) ||
            item.uname.toLowerCase().includes(searchValue)
        );

        const sortableColumns = ["fname", "uname"];
        const orderColumn = Number(order[0]?.column) || 0;
        const orderDirection = order[0]?.dir === "desc" ? -1 : 1;
        const sortKey = sortableColumns[orderColumn] || "fname";

        const sortedData = filteredData.sort((a, b) => {
            const aValue = a[sortKey];
            const bValue = b[sortKey];
            if (aValue < bValue) return -1 * orderDirection;
            if (aValue > bValue) return 1 * orderDirection;
            return 0;
        });

        const paginatedData = sortedData.slice(parsedStart, parsedStart + parsedLength);

        res.json({
            draw: Number(draw) || 1,
            recordsTotal: userList.length,
            recordsFiltered: filteredData.length,
            data: paginatedData
        });
    } catch (error) {
        console.error("Error loading inactive user DataTable:", error);
        res.status(500).json({ error: "DB error" });
    }
};

exports.activateUser = async (req, res) => {
    try {
        const { user_no } = req.body;

        if (!user_no) {
            return res.status(400).json({ success: false, message: "User ID is required." });
        }

        const result = await userModel.activateUser(user_no);

        if (result && result.affectedRows === 1) {
            return res.status(200).json({ success: true, message: "User activated successfully" });
        }

        res.status(404).json({ success: false, message: "User not found." });
    } catch (error) {
        console.error("Error activating user:", error);
        res.status(500).json({ success: false, message: "An error occurred while activating the user." });
    }
};