const Asteroid = require("./asteroid.js");

function Game() {
    this.asteroids = [];
    this.addAsteroids();
}

Game.prototype.addAsteroids = function () {
    let i = 0;
    while (i < Game.NUM_ASTEROIDS) {
        let asteroid = new Asteroid(this.randomPosition(), this);
        this.asteroids.push(asteroid);
        i++;
    }
}

Game.prototype.randomPosition = function () {
    let x = Math.floor(Math.random() * Game.DIM_X);
    let y = Math.floor(Math.random() * Game.DIM_Y);
    return [x, y];
}

Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
    this.asteroids.forEach((asteroid) => asteroid.draw(ctx));
}

Game.prototype.moveObjects = function () {
    for (let i = 0; i < this.asteroids.length; i++) {
        this.asteroids[i].move();
    }
}

Game.prototype.wrap = function (pos) {
    if (pos[0] > Game.DIM_X) {
        pos[0] = 0;
    }
    else if (pos[0] < 0) {
        pos[0] = Game.DIM_X;
    }
    if (pos[1] > Game.DIM_Y) {
        pos[1] = 0;
    }
    else if (pos[1] < 0) {
        pos[1] = Game.DIM_Y;
    }
    return pos;
}

Game.DIM_X = 900;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 10;

module.exports = Game;