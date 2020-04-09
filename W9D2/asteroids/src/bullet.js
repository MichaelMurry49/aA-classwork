const Util = require("./utils.js");
const MovingObject = require("./moving_object.js");

function Bullet(pos, vel, game) {
    let options = {
        pos: [...pos],
        vel: getVel(vel),
        radius: Bullet.RADIUS,
        color: Bullet.COLOR,
        game: game
    };
    MovingObject.call(this, options);
}

function getVel(vel) { 
    let vx = vel[0], vy = vel[1];
    if (vy === 0 && vx === 0) return [0, -7];
    vx = vel[0] * 5;
    vy = vel[1] * 5;
    return [vx, vy];
}
Util.inherits(Bullet, MovingObject);

Bullet.prototype.isWrappable = false;

Bullet.RADIUS = 3;
Bullet.COLOR = "blue";


module.exports = Bullet;