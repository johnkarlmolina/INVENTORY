const { query } = require("../config/db");

exports.peripheralDataTable = async (req, res) => {
    try {
        const peripheralsData = await query(`SELECT * FROM peripherals`);
        return peripheralsData;
    }   
    catch (error) {
        console.error("Error fetching peripherals data:", error);
        throw new Error("An error occurred while fetching peripherals data.");
    }
}