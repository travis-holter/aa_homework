import React from 'react';

class Clock extends React.Component{
    constructor(props){
        super(props);

        this.state = {
            time: new Date()
        }
        this.tick = this.tick.bind(this);
        
    }

    componentDidMount(){
        this.intervalID = setInterval(this.tick, 1000);
    }

    componentWillUnmount(){
        clearInterval(this.intervalID);
    }

    tick(){
        this.setState({ time: new Date() });
    }

    render(){
        return(
            <div id="clock">
                <div id="time">
                    <h1>Time:</h1>
                    <h1> {this.state.time.getHours()}:{this.state.time.getMinutes()}:{this.state.time.getSeconds()}</h1>
                </div>
                <br />
                <div id="date">
                    <h1>Date:</h1>
                    <h1>{this.state.time.getMonth() + 1}/{this.state.time.getDate()}/{this.state.time.getFullYear()}</h1>
                </div>
            </div>
        )
    }
}

export default Clock;