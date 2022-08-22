require("dotenv/config");
const express = require("express");
const app = express();

app.get("/", (_req, res) => {
  res.json({
    node_env: process.env.NODE_ENV,
    deployment_env: process.env.DEPLOYMENT_ENV,
    use_configs: process.env.USE_CONFIGS,
    mlsType: process.env.MLS_TYPE,
  });
});

app.listen(process.env.PORT || 3000, () => {
  console.log("App running");
});
