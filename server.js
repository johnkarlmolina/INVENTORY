const { app, server } = require("./app");
const ngrok = require("ngrok");
const path = require("path");
const fs = require("fs");

const PORT = process.env.PORT || 3000;

server.listen(PORT, async () => {
  let baseUrl = process.env.LOCAL_URL || `https://localhost:${PORT}`;
  
  if (process.env.USE_NGROK === "true") {
    try {
      const url = await ngrok.connect(PORT);
      baseUrl = url;
      // Save ngrok URL to file for easy access
      const filePath = path.join(__dirname, "ngrok-url.txt");
      fs.writeFileSync(filePath, url);
      console.log(`✅ Ngrok tunnel started at: ${url}`);
    } catch (err) {
      console.error("⚠️ Failed to start ngrok:", err);
    }
  }
  
  app.locals.baseUrl = baseUrl;
  console.log(`✅ Server running at: ${baseUrl}`);
});
