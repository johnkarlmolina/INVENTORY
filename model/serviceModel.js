const { query } = require("../config/db");

exports.getAllComputerServices = async () => {
	return query(
		`SELECT service_id, serial_number, property_tag, problem, remarks
		 FROM computer_service
		 ORDER BY service_id DESC`
	);
};

exports.serviceDataTable = async () => {
	return query(
		`SELECT service_id, serial_number, property_tag, problem, remarks
		 FROM computer_service
		 ORDER BY service_id DESC`
	);
};

exports.getComputerServiceById = async (service_id) => {
	const rows = await query(
		`SELECT service_id, serial_number, property_tag, problem, remarks
		 FROM computer_service
		 WHERE service_id = ?`,
		[service_id]
	);
	return rows && rows.length ? rows[0] : null;
};

exports.createComputerService = async (serviceData) => {
	const { serial_number, property_tag, problem, remarks } = serviceData;
	return query(
		`INSERT INTO computer_service (serial_number, property_tag, problem, remarks)
		 VALUES (?, ?, ?, ?)`,
		[serial_number || null, property_tag || null, problem || null, remarks || null]
	);
};

exports.updateComputerService = async (service_id, serviceData) => {
	const { serial_number, property_tag, problem, remarks } = serviceData;
	return query(
		`UPDATE computer_service
		 SET serial_number = ?, property_tag = ?, problem = ?, remarks = ?
		 WHERE service_id = ?`,
		[serial_number || null, property_tag || null, problem || null, remarks || null, service_id]
	);
};

exports.deleteComputerService = async (service_id) => {
	return query(`DELETE FROM computer_service WHERE service_id = ?`, [service_id]);
};

exports.brandSerialOptionsComputer = async() => {
	return query(`select * from main_inventory`)
}


exports.brandSerialOptionsPeripheral = async() => {
	return query(`select * from peripherals`)
}