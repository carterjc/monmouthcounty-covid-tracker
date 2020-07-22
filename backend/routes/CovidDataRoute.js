const express = require('express');
const router = express.Router();
const DataController = require("../controllers/CovidDataController")

router.get("/", (req, res) => {
    DataController.getAllData(req, res);
})

router.get("/day/", (req, res) => {
    DataController.getSumDayData(req, res);
})

router.get("/day/:id", (req, res) => {
    DataController.getDayData(req, res);
})

router.get("/town/:id", (req, res) => {
    DataController.getTownData(req, res);
})

router.post("/", (req, res) => {
    DataController.createData(req, res);
})

router.post("/update/:id", (req, res) => {
    DataController.updateData(req, res);
})

router.delete("/:id", (req, res) => {
    DataController.deleteData(req, res);
})

module.exports = router;