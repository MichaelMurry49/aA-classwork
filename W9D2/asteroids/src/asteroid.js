const Util = require("./utils.js");
const MovingObject = require("./moving_object.js");
const Ship = require("./ship.js");

function Asteroid(pos, game) {
    
    const asteroidProperties = {
        pos: pos,
        vel: Util.randomVec(5),
        radius: Asteroid.RADIUS,
        color: Asteroid.COLOR,
        game: game
    }
    MovingObject.call(this, asteroidProperties);
}
Util.inherits(Asteroid, MovingObject);

Asteroid.prototype.isCollidedWith = function(otherObject) {
    distance = Math.sqrt((this.pos[0] - otherObject.pos[0]) ** 2 + (this.pos[1] - otherObject.pos[1]) ** 2)
    if (distance < this.radius + otherObject.radius) {
        if (otherObject instanceof Ship) otherObject.relocate();
        return true;
    }
    return false;
}

Asteroid.RADIUS = 30;
Asteroid.COLOR = "gray";

module.exports = Asteroid;