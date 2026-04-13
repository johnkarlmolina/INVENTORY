const express = require("express");
const router = express.Router();
const multer = require("multer");
const path = require("path");
const fs = require("fs");
// Computer Controller
const computerController = require("../controller/computerController");
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

function getImageExtFromMime(mime) {
	switch (mime) {
		case "image/jpeg":
			return ".jpg";
		case "image/png":
			return ".png";
		case "image/webp":
			return ".webp";
		case "image/gif":
			return ".gif";
		default:
			return "";
	}
}

const computerUploadsDir = path.join(__dirname, "..", "uploads", "computers");

const computerPdfStorage = multer.diskStorage({
	destination: (req, file, cb) => {
		ensureDirSync(computerUploadsDir);
		cb(null, computerUploadsDir);
	},
	filename: (req, file, cb) => {
		const computerId = sanitizeNumericId(req.params.computerId);
		cb(null, `computer-${computerId}.pdf`);
	}
});

const pdfFileFilter = (req, file, cb) => {
	const isPdf =
		file.mimetype === "application/pdf" ||
		(file.originalname || "").toLowerCase().endsWith(".pdf");
	cb(null, isPdf);
};

const computerPdfUpload = multer({
	storage: computerPdfStorage,
	fileFilter: pdfFileFilter,
	limits: { fileSize: 10 * 1024 * 1024 }
});

function handleComputerPdfUpload(req, res, next) {
	computerPdfUpload.single("pdf")(req, res, (err) => {
		if (err) {
			return res.status(400).json({
				success: false,
				message: err.message || "PDF upload failed"
			});
		}
		next();
	});
}

const computerImageStorage = multer.diskStorage({
	destination: (req, file, cb) => {
		ensureDirSync(computerUploadsDir);
		cb(null, computerUploadsDir);
	},
	filename: (req, file, cb) => {
		const computerId = sanitizeNumericId(req.params.computerId);
		const ext = getImageExtFromMime(file.mimetype) || path.extname(file.originalname || "");
		cb(null, `computer-${computerId}${ext || ""}`);
	}
});

const imageFileFilter = (req, file, cb) => {
	const okTypes = ["image/jpeg", "image/png", "image/webp", "image/gif"];
	cb(null, okTypes.includes(file.mimetype));
};

const computerImageUpload = multer({
	storage: computerImageStorage,
	fileFilter: imageFileFilter,
	limits: { fileSize: 5 * 1024 * 1024 }
});

function handleComputerImageUpload(req, res, next) {
	computerImageUpload.single("image")(req, res, (err) => {
		if (err) {
			return res.status(400).json({
				success: false,
				message: err.message || "Image upload failed"
			});
		}
		next();
	});
}

// Computer Inventory route
router.post("/computerDataTable", computerController.computerDataTable); 
router.post("/inactiveComputerDataTable", requireAdmin, computerController.inactiveComputerDataTable);
router.post("/addComputer", requireAdmin, computerController.addComputer);
router.post("/updateComputer", requireAdmin, computerController.updateComputer);
router.get("/getComputerIds", computerController.getComputerIds);
router.post("/deleteComputer", requireAdmin, computerController.deleteComputer);
router.post("/activateComputer", requireAdmin, computerController.activateComputer);

// Uploads / files
router.post(
	"/uploadComputerPdf/:computerId",
	requireAdmin,
	handleComputerPdfUpload,
	computerController.uploadComputerPdf
);
router.get(
	"/computerPdfStatus/:computerId",
	requireAdmin,
	computerController.computerPdfStatus
);
router.get(
	"/viewComputerPdf/:computerId",
	requireAdmin,
	computerController.viewComputerPdf
);
router.post(
	"/uploadComputerImage/:computerId",
	requireAdmin,
	handleComputerImageUpload,
	computerController.uploadComputerImage
);

module.exports = router;