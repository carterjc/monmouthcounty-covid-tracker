import React from 'react';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import Navbar from "./components/Navbar/Navbar.js";
import Home from "./containers/Home/Home.js";
import About from './containers/About/About';
import Footer from "./components/Footer/Footer";

function App() {
  return (
    <div>
        <Router>
            <div>
                <Navbar/>
        <Switch>
            <Route exact component={Home} path="/"/>
            <Route path="/about" component={About} />
        </Switch>
            </div>
        </Router>
        <Footer></Footer>
    </div>
  );
}

export default App;
