const computerModel = require("../model/computerModel");
const { missingFields, trimObjectStrings } = require("../utils/validation");
const path = require("path");
const fs = require("fs");

function sanitizeNumericId(value) {
  const cleaned = String(value || "").replace(/[^0-9]/g, "");
  return cleaned || "0";
}

function getComputerUploadsDir() {
  return path.join(__dirname, "..", "uploads", "computers");
}

exports.computerDataTable = async (req, res) => {
  try {
    const {
      draw = 1,
      start = 0,
      length = 10,
      search = { value: "" },
      order = [{ column: 0, dir: "asc" }]
    } = req.body;

    // Fetch data
    const computers = await computerModel.computerDataTable();

    // Map safely (NO Date objects ❗)
    const computerList = computers.map(item => ({
      computer_id: item.computer_id,
      brand: item.brand || "",
      model: item.model || "",
      serial_number: item.serial_number || "",
      property_tag: item.property_tag || "",
      os_version: item.os_version || "",
      procie: item.procie || "",
      ram: item.ram || "",
      os_license: item.os_license || "",
      pc_user: item.pc_user || "",
      user_dept: item.user_dept || "",
      date_of_purchase: item.date_of_purchase || "",
      date_of_entry: item.date_of_entry || "",
      office_license: item.office_license || "",
      picture_of_pc: item.picture_of_pc || "",
      pc_no: item.pc_no || "",
      pc_status: item.pc_status || "",
      pc_location: item.pc_location || ""
    }));

    // TOTAL BEFORE FILTER
    const recordsTotal = computerList.length;

    // 🔍 SEARCH
    const searchValue = (search.value || "").toLowerCase();

    let filteredData = computerList.filter(item =>
      item.brand.toLowerCase().includes(searchValue) ||
      item.model.toLowerCase().includes(searchValue) ||
      item.serial_number.toLowerCase().includes(searchValue) ||
      item.property_tag.toLowerCase().includes(searchValue) ||
      item.os_version.toLowerCase().includes(searchValue) ||
      item.procie.toLowerCase().includes(searchValue) ||
      item.ram.toLowerCase().includes(searchValue) ||
      item.os_license.toLowerCase().includes(searchValue) ||
      item.pc_user.toLowerCase().includes(searchValue) ||
      item.user_dept.toLowerCase().includes(searchValue) ||
      item.office_license.toLowerCase().includes(searchValue) ||
      item.pc_no.toLowerCase().includes(searchValue) ||
      item.pc_status.toLowerCase().includes(searchValue) ||
      item.pc_location.toLowerCase().includes(searchValue) ||
      item.date_of_purchase.toString().toLowerCase().includes(searchValue) ||
      item.date_of_entry.toString().toLowerCase().includes(searchValue)
    );

    const recordsFiltered = filteredData.length;

    // 🔄 SORT
    const columns = [
      "brand",
      "model",
      "serial_number",
      "property_tag",
      "os_version",
      "procie",
      "ram",
      "os_license",
      "pc_user",
      "user_dept",
      "date_of_purchase",
      "date_of_entry",
      "office_license",
      "pc_no",
      "pc_status",
      "pc_location"
    ];

    const columnIndex = order[0]?.column ?? 0;
    const columnName = columns[columnIndex];
    const dir = order[0]?.dir === "desc" ? "desc" : "asc";

    if (columnName) {
      filteredData.sort((a, b) => {
        const aValue = a[columnName];
        const bValue = b[columnName];

        if (aValue < bValue) return dir === "asc" ? -1 : 1;
        if (aValue > bValue) return dir === "asc" ? 1 : -1;
        return 0;
      });
    }

    // 📄 PAGINATION
    const startNum = parseInt(start);
    const lengthNum = parseInt(length);

    const data = filteredData.slice(startNum, startNum + lengthNum);

    // ✅ RESPONSE
    res.json({
      draw: parseInt(draw),
      recordsTotal,
      recordsFiltered,
      data
    });

  } catch (error) {
    console.error("Error fetching computers:", error);

    res.status(500).json({
      draw: 0,
      recordsTotal: 0,
      recordsFiltered: 0,
      data: [],
      error: error.message
    });
  }
};

exports.inactiveComputerDataTable = async (req, res) => {
  try {
    const {
      draw = 1,
      start = 0,
      length = 10,
      search = { value: "" },
      order = [{ column: 0, dir: "asc" }]
    } = req.body;

    const computers = await computerModel.inactiveComputerDataTable();

    const computerList = computers.map(item => ({
      computer_id: item.computer_id,
      pc_no: item.pc_no || "",
      brand: item.brand || "",
      model: item.model || "",
      pc_user: item.pc_user || ""
    }));

    const recordsTotal = computerList.length;
    const searchValue = (search.value || "").toLowerCase();

    let filteredData = computerList.filter(item =>
      item.pc_no.toLowerCase().includes(searchValue) ||
      item.brand.toLowerCase().includes(searchValue) ||
      item.model.toLowerCase().includes(searchValue) ||
      item.pc_user.toLowerCase().includes(searchValue)
    );

    const recordsFiltered = filteredData.length;

    const columns = ["pc_no", "brand", "model", "pc_user"];
    const columnIndex = order[0]?.column ?? 0;
    const columnName = columns[columnIndex];
    const dir = order[0]?.dir === "desc" ? "desc" : "asc";

    if (columnName) {
      filteredData.sort((a, b) => {
        const aValue = a[columnName];
        const bValue = b[columnName];

        if (aValue < bValue) return dir === "asc" ? -1 : 1;
        if (aValue > bValue) return dir === "asc" ? 1 : -1;
        return 0;
      });
    }

    const startNum = parseInt(start);
    const lengthNum = parseInt(length);
    const data = filteredData.slice(startNum, startNum + lengthNum);

    res.json({
      draw: parseInt(draw),
      recordsTotal,
      recordsFiltered,
      data
    });
  } catch (error) {
    console.error("Error fetching inactive computers:", error);
    res.status(500).json({
      draw: 0,
      recordsTotal: 0,
      recordsFiltered: 0,
      data: [],
      error: error.message
    });
  }
};

exports.addComputer = async (req, res) => {
    try {
        const body = trimObjectStrings(req.body);
        const required = [
          "pc_no",
          "brand",
          "model",
          "serial_number",
          "property_tag",
          "pc_user",
          "user_dept",
          "pc_status",
          "pc_location",
        ];
        const missing = missingFields(body, required);
        if (missing.length) {
          return res.status(400).json({
            success: false,
            message: `Missing required fields: ${missing.join(", ")}`,
          });
        }

        const result = await computerModel.addComputer(body);

        if (result && result.affectedRows === 1) {
      const io = req.app.get("io");
      if (io) io.emit("reports:refresh");
            res.json({
                success: true,
            message: "Computer added successfully",
            computer_id: result.insertId || null
            });
        } else {
            res.status(400).json({
                success: false,
                message: "Insert failed"
            });
        }

    } catch (err) {
        console.error(err);
        res.status(500).json({
            success: false,
            message: "Database error"
        });
    }
};

exports.updateComputer = async (req, res) => {
  try {
    const result = await computerModel.updateComputer(req.body);

    if (result && result.affectedRows === 1) {
      const io = req.app.get("io");
      if (io) io.emit("reports:refresh");
      res.json({
        success: true,
        message: "Computer updated successfully"
      });
    } else {
      res.status(400).json({
        success: false,
        message: "Update failed"
      });
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({
      success: false,
      message: "Database error"
    });
  }
};

exports.getComputerIds = async (req, res) => {
    try {
        const data = await computerModel.getComputerIds();  
        
        res.json({ computerIds: data });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: "Database error" });
    }
};

exports.deleteComputer = async (req, res) => {
    try {
        const { computer_id } = req.body;
        console.log("received data:", computer_id);
        await computerModel.deleteComputer(computer_id);
    const io = req.app.get("io");
    if (io) io.emit("reports:refresh");
        res.json({ success: true, message: "Computer deleted successfully" });
    } catch (error) {
        console.error("Error deleting computer:", error);
        res.status(500).json({ success: false, message: "An error occurred while deleting the computer." });
    }
};

  exports.activateComputer = async (req, res) => {
    try {
      const { computer_id } = req.body;
      if (!computer_id) {
        return res.status(400).json({ success: false, message: "computer_id is required" });
      }
      await computerModel.activateComputer(computer_id);
      const io = req.app.get("io");
      if (io) io.emit("reports:refresh");
      res.json({ success: true, message: "Computer activated successfully" });
    } catch (error) {
      console.error("Error activating computer:", error);
      res.status(500).json({ success: false, message: "An error occurred while activating the computer." });
    }
  };

exports.uploadComputerPdf = async (req, res) => {
  try {
    const computerId = sanitizeNumericId(req.params.computerId);
    if (!req.file) {
      return res.status(400).json({ success: false, message: "No PDF file uploaded" });
    }
    const io = req.app.get("io");
    if (io) io.emit("reports:refresh");
    return res.json({ success: true, message: "PDF uploaded successfully", computer_id: computerId });
  } catch (error) {
    console.error("Error uploading computer PDF:", error);
    return res.status(500).json({ success: false, message: "An error occurred while uploading the PDF." });
  }
};

exports.computerPdfStatus = async (req, res) => {
  try {
    const computerId = sanitizeNumericId(req.params.computerId);
    const pdfPath = path.join(getComputerUploadsDir(), `computer-${computerId}.pdf`);
    const exists = fs.existsSync(pdfPath);
    return res.json({
      success: true,
      computer_id: computerId,
      exists,
      urlPath: exists ? `/computers/viewComputerPdf/${computerId}` : null
    });
  } catch (error) {
    console.error("Error checking computer PDF status:", error);
    return res.status(500).json({ success: false, message: "Failed to check PDF status." });
  }
};

exports.viewComputerPdf = async (req, res) => {
  try {
    const computerId = sanitizeNumericId(req.params.computerId);
    const pdfPath = path.join(getComputerUploadsDir(), `computer-${computerId}.pdf`);
    if (!fs.existsSync(pdfPath)) {
      return res.status(404).send("PDF not found");
    }
    return res.sendFile(pdfPath);
  } catch (error) {
    console.error("Error viewing computer PDF:", error);
    return res.status(500).send("Failed to view PDF");
  }
};

exports.uploadComputerImage = async (req, res) => {
  try {
    const computerId = sanitizeNumericId(req.params.computerId);
    if (!req.file) {
      return res.status(400).json({ success: false, message: "No image file uploaded" });
    }
    await computerModel.updateComputerPicture(computerId, req.file.filename);
    const io = req.app.get("io");
    if (io) io.emit("reports:refresh");
    return res.json({
      success: true,
      message: "Image uploaded successfully",
      fileName: req.file.filename,
      computer_id: computerId
    });
  } catch (error) {
    console.error("Error uploading computer image:", error);
    return res.status(500).json({ success: false, message: "An error occurred while uploading the image." });
  }
};