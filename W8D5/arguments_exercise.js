class Clock {
    constructor() {
        const date = new Date();;
        this.hour = date.getHours();;
        this.minute = date.getMinutes();;
        this.second = date.getSeconds();;
        this.printTime();
        setInterval(this._tick.bind(this), 1000);
    }

    printTime() {
        const current_time = [this.hour, this.minute, this.second].join(":");
        console.log(current_time);
    }

    _tick() {
        // debugger
        // date.setSeconds(date.getSeconds() + wait_time);
        // setInterval(printTime, wait_time);
        this.addSeconds();
        this.printTime();
    }

    addSeconds() {
        this.second += 1;
        if(this.second === 60) {
            this.second = 0;
            this.addMinutes();

        }
    }

    addMinutes() {
        this.minute += 1;
        if(this.minute === 60) {
            this.minute = 0;
            this.addHours();
        }
    }

    addHours() {
        this.hour += 1
        if(this.hour === 13) {
            this.hour = 1;
        }
    }
};
// setInterval(callback, delay, ...)
const clock = new Clock();

