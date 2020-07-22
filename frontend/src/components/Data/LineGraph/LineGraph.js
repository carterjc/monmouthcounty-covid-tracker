import React, {Component} from "react"
import { Line } from "react-chartjs-2";
import axios from 'axios';
import "./LineGraph.css"

class LineGraph extends Component {
  constructor(props) {
    super(props);
    this.state = { Data: {} };
  }

  componentDidMount() {
    axios.get(this.props.api)
      .then(res => {
        console.log(res);
        const ipl = res.data;
        let days = [];
        let cases = [];
        ipl.forEach(record => {
          days.push(record.day_date.substring(0, 10));
          cases.push(record.cases);
        });
        console.log(days)
        this.setState({
          Data: {
            labels: days,
            datasets: [
              {
                label: "Monmouth County COVID-19 Overall Cases",
                data: cases,
                backgroundColor: "White",
                options: {
                  responsive: true
                }
              }
            ]
          }
        })
      })
  }

  render() {
    return (
      <div class="chart">
        <Line
          data={this.state.Data}
          options={ { maintainAspectRatio: true }}
        />
      </div>
    )
  }
}

export default LineGraph;
