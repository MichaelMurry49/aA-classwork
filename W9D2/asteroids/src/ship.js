const Util = require("./utils.js");
const MovingObject = require("./moving_object.js");

Ship.RADIUS = 10;
Ship.COLOR = "white";

function Ship(game) {
    let options = {
        pos: game.randomPosition(),
        vel: Util.randomVec(0),
        radius: Ship.RADIUS,
        color: Ship.COLOR,
        game: game
    };
    MovingObject.call(this, options);
}

const relocate = function() {
    this.pos = this.game.randomPosition();
}
Util.inherits(Ship, MovingObject);

module.exports = Ship;