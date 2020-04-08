function MovingObject(obj) {
    console.log(obj)
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
    ctx.stroke();
}

MovingObject.prototype.move = function () {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
    this.pos = this.game.wrap(this.pos);
}

MovingObject.prototype.isCollidedWith = function (otherObject) {
    //collision if center1 - center2 < radius1 + radius2
    //distance => Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)
    // distance = sqrt((this.pos[0] - otherObject.pos[0]) ** 2 + (this.post[1] - otherObject.pos[1]) ** 2)
    // if () {

    // }
}

module.exports = MovingObject;