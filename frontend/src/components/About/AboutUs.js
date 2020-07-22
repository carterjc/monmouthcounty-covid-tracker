import React from 'react';

class AboutUs extends React.Component{
    render(){
        return (
            <div className ="jumbotron jumbotron-fluid">
                <div className="container">
                    <h1 className="display-3 text-center">About Us</h1>
                    <div className="text-center">
                        <h3 className="aboutusbody">{this.props.AboutUs}</h3>
                    </div>
                    <h1 className="display-3 text-center">Our Story</h1>
                    <div className="text-center">
                        <h3 className="ourstorybody">{this.props.OurStory}</h3>
                    </div>
                </div>
                
            </div>
        );
    }

}

export default AboutUs;