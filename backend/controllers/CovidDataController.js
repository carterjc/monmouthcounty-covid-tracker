const CovidData = require('../models/CovidData');
const db = require('../models/db');

module.exports = {
    getAllData: async function (req, res) {
        var sql = "SELECT c.case_id, t.mun, c.cases, c.day_date FROM covid_data c JOIN towns t ON c.town_id = t.town_id"
        db.query(sql, function(err, rows, fields) {
            if (err) {
                res.status.send({ error: err });
            };
            res.json(rows);
        });
    },
    getSumDayData: async function (req, res) {
        var sql = "SELECT day_date, SUM(cases) AS 'cases' FROM covid_data GROUP BY day_date"
        db.query(sql, function(err, rows, fields) {
            if (err) {
                res.status.send({ error: err });
            };
            res.json(rows);
        });
    },
    getDayData: async function (req, res) {
        var sql = "SELECT c.case_id, t.mun, c.cases, c.day_date FROM covid_data c JOIN towns t ON c.town_id = t.town_id WHERE c.day_date = ?"
        db.query(sql, req.params.id, function(err, rows, fields) {
            if (err) {
                res.status.send({ error: err });
            };
            res.json(rows);
        });
    },
    getTownData: async function (req, res) {
        var sql = "SELECT c.case_id, t.mun, c.cases, c.day_date FROM covid_data c JOIN towns t ON c.town_id = t.town_id WHERE c.town_id = 1"
        db.query(sql, req.params.id, function(err, rows, fields) {
            if (err) {
                res.status.send({ error: err });
            };
            res.json(rows);
        });
    },
    createData: async function (req, res) {
        
        if (!req.body) {
            res.status(400).send({ message: "Content cannot be empty" });
        };

        const data = new CovidData({
            town_id: req.body.town_id,
            cases: req.body.cases,
            day_date: req.body.day_date,
            date_added: new Date().toISOString().slice(0, 19).replace('T', ' ')
        });

        db.query("INSERT INTO covid_data SET ?", data, (err, resp) => {
            if (err) {
                console.log(err);
                res.status(500).send({ error: err });
            } else {
                console.log(resp.insertId);
                res.send(data);

            }
        });
    },
    updateData: async function (req, res) {

        if (!req.body) {
            res.status(400).send({ message: "Content cannot be empty" });
        };

        const data = new CovidData({
            town_id: req.body.town_id,
            cases: req.body.cases,
            day_date: req.body.day_date,
            date_added: new Date().toISOString().slice(0, 19).replace('T', ' ')
        });


        db.query(
            "UPDATE covid_data SET town_id = ?, cases = ?, day_date = ?, date_added = ? WHERE case_id = ?",
            [data.town_id, data.cases, data.day_date, data.date_added, req.params.id],
            (err, resp) => {
                if (err) {
                    console.log(err);
                    res.status(500).send({ error: err });
                } else {
                    console.log(resp.insertId);
                    res.send(data);    
                }
            }
        )
    },
    deleteData: async function (req, res) {
        db.query("DELETE FROM covid_data WHERE case_id = ?", parseInt(req.params.id), (err, resp) => {
            if (err) {
                console.log(err);
                res.status(500).send({ error: err });
            } else {
                console.log(resp.insertId);
                res.send({message: "Data deleted"});
            }
        });
    }
};