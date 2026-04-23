import express from "express";
const app = express();

app.get("/home", (req, res) => {
  res.json({ message: "Welcome to the API!" });
});

app.listen(process.env.PORT);
