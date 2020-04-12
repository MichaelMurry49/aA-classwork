const Coord = require('./coord.js');

class Apple {

    constructor() {
        let x = Math.floor(Math.random() * BOARD_ROWS) + 1;
        let y = Math.floor(Math.random() * BOARD_COLS) + 1;
        this.coord = new Coord(x, y);
    }
}

const BOARD_COLS = 39;
const BOARD_ROWS = 29;
module.exports = Apple;