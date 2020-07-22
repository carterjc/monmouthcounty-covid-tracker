const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const PORT = 8080 || process.env.PORT
const cors = require('cors');

app.use(cors());

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true}));

app.use(express.json());

const api_pre = "/api/v1/";

app.get(api_pre, (req, res) => {
    res.json({ message: "Monmouth County COVID data API"});
});

const dataRouter = require('./routes/CovidDataRoute');
app.use(api_pre + 'data', dataRouter);

app.listen(PORT, () => {
    console.log("Server is running on port " + PORT)
})