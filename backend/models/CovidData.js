const CovidData = function(coviddata) {
    this.case_id = coviddata.case_id,
    this.town_id = coviddata.town_id,
    this.cases = coviddata.cases,
    this.day_date = coviddata.day_date,
    this.date_added = coviddata.date_added
};

module.exports = CovidData;