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
Util.inherits(Ship, MovingObject);

Ship.prototype.relocate = function() {
    this.pos = this.game.randomPosition();
}

Ship.prototype.power = function(impuse) {
    this.vel += impuse;
}

module.exports = Ship;