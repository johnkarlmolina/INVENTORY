const selfsigned = require("selfsigned");
const fs = require("fs");
const path = require("path");

async function generate() {
  const sslDir = path.join(__dirname, "ssl");

  if (!fs.existsSync(sslDir)) {
    fs.mkdirSync(sslDir, { recursive: true });
  }

  const attrs = [{ name: "commonName", value: "localhost" }];

  const pems = await selfsigned.generate(attrs, {
    keySize: 2048,
    days: 365,
    algorithm: "sha256"
  });

  const privateKey = pems.privateKey || pems.private;
  const certificate = pems.cert;

  fs.writeFileSync(path.join(sslDir, "key.pem"), privateKey);
  fs.writeFileSync(path.join(sslDir, "cert.pem"), certificate);

  console.log("✅ key.pem and cert.pem generated!");
}

generate().catch(console.error);
