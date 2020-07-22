import React from "react";
import LineGraph from "../../components/Data/LineGraph/LineGraph"

class Home extends React.Component {
    render() {
        return(
            <div>
                <h1>Home</h1>
                <LineGraph
                    api="http://192.168.1.230:8080/api/v1/data/day"
                />
            </div>
        )
    };
};

export default Home;