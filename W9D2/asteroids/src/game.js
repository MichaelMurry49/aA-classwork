const Asteroid = require("./asteroid.js");
const Ship = require('./ship.js');

function Game() {
    this.asteroids = [];
    this.ship = new Ship( this);
    this.addAsteroids();
    this.objects = this.allObjects();
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
    for (let object of this.objects) object.draw(ctx);
}

Game.prototype.moveObjects = function () {
    // for (let i = 0; i < this.asteroids.length; i++) {
    //     this.asteroids[i].move();
    // }
    for (let object of this.objects) object.move();
}

Game.prototype.wrap = function(pos) {
    if (pos[0] > Game.DIM_X) pos[0] = 0;
    else if (pos[0] < 0) pos[0] = Game.DIM_X;
    
    if (pos[1] > Game.DIM_Y) pos[1] = 0;
    else if (pos[1] < 0) pos[1] = Game.DIM_Y;
    
    return pos;
}

Game.prototype.step = function() {
    this.moveObjects();
    let len = this.asteroids.length;
    let removed = new Set();
    for (let i = 0; i < len - 1; i++) {
        for (let j = i + 1; j < len; j++) {
            if (this.asteroids[i].isCollidedWith(this.asteroids[j])) {
                removed.add(this.asteroids[i]);
                removed.add(this.asteroids[j]);
            }
        }
    }
    removed = Array.from(removed);
    for (let i = 0; i < removed.length; i++) {
        this.remove(removed[i]);
    }
}

Game.prototype.checkCollisions = function() {
    let len = this.objects.length;
    let removed = new Set();
    for (let i = 0; i < len - 1; i++) {
        for (let j = i + 1; j < len; j++) {
            if (this.objects[i].isCollidedWith(this.objects[j])) {
                removed.add(this.objects[i]);
                removed.add(this.objects[j]);
            }
        }
    }
    // removed = Array.from(removed);
    // for (let i = 0; i < removed.length; i++) {
    //     this.remove(removed[i]);
    // }
}

Game.prototype.remove = function(asteroid) {
    for (let i = 0; i < this.asteroids.length; i++) {
        if (this.asteroids[i].pos[0] === asteroid.pos[0] 
            && this.asteroids[i].pos[1] === asteroid.pos[1])
            this.asteroids.splice(i, 1);
    }
}

Game.prototype.allObjects = function() {
    let objects = [];
    objects = objects.concat(this.asteroids);
    objects.push(this.ship);
    return objects;
}

Game.DIM_X = 900;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 7;

module.exports = Game;