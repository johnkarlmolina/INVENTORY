const express = require("express");
const router = express.Router();

const multer = require("multer");
const path = require("path");
const fs = require("fs");

const peripheralController = require("../controller/peripheralController");
const { requireAdmin } = require("../middleware/authMiddleware");

function ensureDirSync(dir) {
	try {
		fs.mkdirSync(dir, { recursive: true });
	} catch (e) {
		// ignore
	}
}

function sanitizeNumericId(value) {
	const cleaned = String(value || "").replace(/[^0-9]/g, "");
	return cleaned || "0";
}

const peripheralUploadsDir = path.join(__dirname, "..", "uploads", "peripherals");

const peripheralPdfStorage = multer.diskStorage({
	destination: (req, file, cb) => {
		ensureDirSync(peripheralUploadsDir);
		cb(null, peripheralUploadsDir);
	},
	filename: (req, file, cb) => {
		const peripheralId = sanitizeNumericId(req.params.peripheralId);
		cb(null, `peripheral-${peripheralId}.pdf`);
	}
});

const pdfFileFilter = (req, file, cb) => {
	const isPdf =
		file.mimetype === "application/pdf" ||
		(file.originalname || "").toLowerCase().endsWith(".pdf");
	cb(null, isPdf);
};

const peripheralPdfUpload = multer({
	storage: peripheralPdfStorage,
	fileFilter: pdfFileFilter,
	limits: { fileSize: 10 * 1024 * 1024 }
});

function handlePeripheralPdfUpload(req, res, next) {
	peripheralPdfUpload.single("pdf")(req, res, (err) => {
		if (err) {
			return res.status(400).json({
				success: false,
				message: err.message || "PDF upload failed"
			});
		}
		next();
	});
}
// Peripherals Inventory route
router.get("/peripheralPageRender", peripheralController.peripheralPageRender);
router.post("/peripheralDataTable", peripheralController.peripheralDataTable);
router.post("/inactivePeripheralDataTable", requireAdmin, peripheralController.inactivePeripheralDataTable);
router.post("/addPeripheral", requireAdmin, peripheralController.addPeripheral);
router.post("/updatePeripheral", requireAdmin, peripheralController.updatePeripheral);
router.post("/deletePeripheral", requireAdmin, peripheralController.deletePeripheral);
router.post("/activatePeripheral", requireAdmin, peripheralController.activatePeripheral);

// Uploads / files
router.post(
	"/uploadPeripheralPdf/:peripheralId",
	requireAdmin,
	handlePeripheralPdfUpload,
	peripheralController.uploadPeripheralPdf
);
router.get(
	"/peripheralPdfStatus/:peripheralId",
	requireAdmin,
	peripheralController.peripheralPdfStatus
);
router.get(
	"/viewPeripheralPdf/:peripheralId",
	requireAdmin,
	peripheralController.viewPeripheralPdf
);

module.exports = router;