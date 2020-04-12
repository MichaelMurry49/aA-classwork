const Coord = require('./coord.js');

class Snake {
    constructor() {
        this.body = [];
        this.coord = new Coord(START_X, START_Y);
        this.body.push(this.coord);
        this.len = 1;
    }

    move(dir) {
        for (let i = 1; i < this.body.length; i++) {
            this.body[i]= new Coord(this.body[i - 1].x, this.body[i - 1].y)
        }
        this.body[0].x += dir[0];
        this.body[0].y += dir[1];
    }
}

const START_X = 23;
const START_Y = 20;

module.exports = Snake;