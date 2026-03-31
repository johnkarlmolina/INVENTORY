const peripheralModel = require("../model/peripheralModel");
exports.peripheralPageRender = async (req, res) => {    
    try {
        res.render("peripherals", {
            page: "peripherals",
            title: "Peripherals Inventory",
        });
    } catch (error) {
        console.error("Error rendering peripherals page:", error);
        res.status(500).send("An error occurred while loading the peripherals page.");
    }


}

exports.peripheralDataTable = async (req, res) => {
  try {
    const {
      draw = 1,
      start = 0,
      length = 10,
      search = { value: "" },
      order = [{ column: 0, dir: "asc" }]
    } = req.body;

    // Fetch data
    const peripherals = await peripheralModel.peripheralDataTable();

    // Map data safely (NO Date objects ❗)
    const peripheralList = peripherals.map(item => ({
      peripheral_id: item.peripheral_id,
      brand: item.brand || "",
      model: item.model || "",
      date_of_purchase: item.date_of_purchase || "",
      date_of_entry: item.date_of_entry || "",
      computer_id: item.computer_id || "",
      peripheral_user: item.peripheral_user || "",
      user_dept: item.user_dept || "",
      kind_of_peripheral: item.kind_of_peripheral || "",
      serial_no: item.serial_no || "",
      property_tag: item.property_tag || "",
      peripheral_no: item.peripheral_no || "",
      peripheral_status: item.peripheral_status || "",
      peripheral_location: item.peripheral_location || ""
    }));

    // TOTAL BEFORE FILTER
    const recordsTotal = peripheralList.length;

    // 🔍 SEARCH
    const searchValue = (search.value || "").toLowerCase();

    let filteredData = peripheralList.filter(item =>
      item.brand.toLowerCase().includes(searchValue) ||
      item.model.toLowerCase().includes(searchValue) ||
      item.peripheral_user.toLowerCase().includes(searchValue) ||
      item.user_dept.toLowerCase().includes(searchValue) ||
      item.kind_of_peripheral.toLowerCase().includes(searchValue) ||
      item.serial_no.toLowerCase().includes(searchValue) ||
      item.property_tag.toLowerCase().includes(searchValue) ||
      item.peripheral_no.toLowerCase().includes(searchValue) ||
      item.peripheral_status.toLowerCase().includes(searchValue) ||
      item.peripheral_location.toLowerCase().includes(searchValue) ||
      item.date_of_purchase.toString().toLowerCase().includes(searchValue) ||
      item.date_of_entry.toString().toLowerCase().includes(searchValue)
    );

    const recordsFiltered = filteredData.length;

    // 🔄 SORT
    const columns = [
      "brand",
      "model",
      "date_of_purchase",
      "date_of_entry",
      "peripheral_user",
      "user_dept",
      "kind_of_peripheral",
      "serial_no",
      "property_tag",
      "peripheral_no",
      "peripheral_status",
      "peripheral_location"
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
    console.error("Error fetching peripherals:", error);

    res.status(500).json({
      draw: 0,
      recordsTotal: 0,
      recordsFiltered: 0,
      data: [],
      error: error.message
    });
  }
};

exports.inactivePeripheralDataTable = async (req, res) => {
  try {
    const {
      draw = 1,
      start = 0,
      length = 10,
      search = { value: "" },
      order = [{ column: 0, dir: "asc" }]
    } = req.body;

    const peripherals = await peripheralModel.inactivePeripheralDataTable();

    const peripheralList = peripherals.map(item => ({
      peripheral_id: item.peripheral_id,
      brand: item.brand || "",
      model: item.model || "",
      peripheral_user: item.peripheral_user || "",
      peripheral_no: item.peripheral_no || ""
    }));

    const recordsTotal = peripheralList.length;
    const searchValue = (search.value || "").toLowerCase();

    let filteredData = peripheralList.filter(item =>
      item.brand.toLowerCase().includes(searchValue) ||
      item.model.toLowerCase().includes(searchValue) ||
      item.peripheral_user.toLowerCase().includes(searchValue) ||
      item.peripheral_no.toLowerCase().includes(searchValue)
    );

    const recordsFiltered = filteredData.length;

    const columns = ["brand", "model", "peripheral_user", "peripheral_no"];
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
    console.error("Error fetching inactive peripherals:", error);

    res.status(500).json({
      draw: 0,
      recordsTotal: 0,
      recordsFiltered: 0,
      data: [],
      error: error.message
    });
  }
};

exports.addPeripheral = async (req, res) => {
    try {
        const { brand, 
                model, 
                date_of_purchase, 
                peripheral_user, 
                user_dept, 
                kind_of_peripheral, 
                serial_no, 
                property_tag, 
                peripheral_no, 
                peripheral_status, 
                peripheral_location, computer_id} = req.body;    
        const result = await peripheralModel.addPeripheral(brand, model, date_of_purchase, peripheral_user, user_dept, kind_of_peripheral, serial_no, property_tag, peripheral_no, peripheral_status, peripheral_location, computer_id);
    const io = req.app.get("io");
    if (io) io.emit("reports:refresh");
        res.json({ success: true, message: "Peripheral added successfully" });
    }
    catch (error) {
        console.error("Error adding peripheral:", error);
        res.status(500).json({ error: "An error occurred while adding the peripheral." });
    }   
}

exports.updatePeripheral = async (req, res) => {
  try {
    const result = await peripheralModel.updatePeripheral(req.body);

    if (result && result.affectedRows === 1) {
      const io = req.app.get("io");
      if (io) io.emit("reports:refresh");
      res.json({
        success: true,
        message: "Peripheral updated successfully"
      });
    } else {
      res.status(400).json({
        success: false,
        message: "Update failed"
      });
    }
  }
  catch (error) {
    console.error("Error updating peripheral:", error);
    res.status(500).json({ success: false, message: "An error occurred while updating the peripheral." });
  }
}

exports.deletePeripheral = async (req, res) => {
    try {
        const { peripheral_id } = req.body;
        await peripheralModel.deletePeripheral(peripheral_id);
    const io = req.app.get("io");
    if (io) io.emit("reports:refresh");
        res.json({ success: true, message: "Peripheral deleted successfully" });
    } catch (error) {
        console.error("Error deleting peripheral:", error);
        res.status(500).json({ success: false, message: "An error occurred while deleting the peripheral." });
    }
}

    exports.activatePeripheral = async (req, res) => {
      try {
        const { peripheral_id } = req.body;
        await peripheralModel.activatePeripheral(peripheral_id);
        const io = req.app.get("io");
        if (io) io.emit("reports:refresh");
        res.json({ success: true, message: "Peripheral activated successfully" });
      } catch (error) {
        console.error("Error activating peripheral:", error);
        res.status(500).json({ success: false, message: "An error occurred while activating the peripheral." });
      }
    }