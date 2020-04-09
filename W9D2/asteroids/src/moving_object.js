function MovingObject(obj) {
    this.pos = obj.pos;
    this.vel = obj.vel;
    this.radius = obj.radius;
    this.color = obj.color;
    this.game = obj.game;
}

MovingObject.prototype.draw = function (ctx) {
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
    ctx.fillStyle = this.color;
    ctx.fill();
}

MovingObject.prototype.move = function (delta) {
    delta = delta || 1;
    this.pos[0] += this.vel[0] * delta;
    this.pos[1] += this.vel[1] * delta;
    if (this.isWrappable) this.pos = this.game.wrap(this.pos);
}

MovingObject.prototype.isWrappable = true;

MovingObject.prototype.isCollidedWith = function(otherObject) {}

module.exports = MovingObject;