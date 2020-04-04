class Clock {
    constructor() {
        // 1. Create a Date object.
        this.time = new Date();
        // 2. Store the hours, minutes, and seconds.
        this.hours = this.time.getHours();
        this.minutes = this.time.getMinutes();
        this.seconds = this.time.getSeconds();
        // 3. Call printTime.
        this.printTime();
        // 4. Schedule the tick at 1 second intervals.
        setInterval(() => this._tick(), 1000);
        // setInterval(this._tick.bind(this), 1000);
    }

    printTime() {
        // Format the time in HH:MM:SS
        let hour = String(this.hours);
        let minute = String(this.minutes);
        let second = String(this.seconds);
        if (hour.length < 2) {
            hour = '0' + hour;
        }
        if (minute.length < 2) {
            minute = '0' + minute;
        }
        if (second.length < 2) {
            second = '0' + second;
        }
        // Use console.log to print it.
        console.log(`${hour}:${minute}:${second}`);
    }

    _tick() {
        // 1. Increment the time by one second.
        if (this.seconds < 59) {
            this.seconds++;
        } else {
            this.seconds = 0;
            if (this.minutes < 59) {
                this.minutes++;
            } else {
                this.minutes = 0;
                if (this.hours < 23) {
                    this.hours++;
                } else {
                    this.hours = 0;
                }
            }
        }
        // 2. Call printTime.
        this.printTime();
    }
}

const clock = new Clock();