const Util = require("./utils.js");
const MovingObject = require("./moving_object.js");

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
Asteroid.RADIUS = 30;
Asteroid.COLOR = "gray";
Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;