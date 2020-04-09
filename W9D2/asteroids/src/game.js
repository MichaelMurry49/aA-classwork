const Asteroid = require("./asteroid.js");
const Ship = require('./ship.js');
const Bullet = require('./bullet.js');

function Game() {
    this.asteroids = [];
    this.ship = new Ship( this);
    this.addAsteroids();
    this.objects = this.allObjects();
    this.bullets = [];
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
    for (let i = 0; i < this.objects.length; i++) {
        let object = this.objects[i];
        object.move();
        if (this.isOutOfBounds(object.pos)) {
            if (object instanceof Bullet)
                this.objects.splice(i, 1);
        }
    }
}

Game.prototype.wrap = function(pos) {
    if (pos[0] > Game.DIM_X) pos[0] = 0;
    else if (pos[0] < 0) pos[0] = Game.DIM_X;
    
    if (pos[1] > Game.DIM_Y) pos[1] = 0;
    else if (pos[1] < 0) pos[1] = Game.DIM_Y;
    
    return pos;
}

Game.prototype.isOutOfBounds = function(pos) {
    return pos[0] < 0 || pos[1] < 0 || pos[0] > Game.DIM_X || pos[1] > Game.DIM_Y;
}

Game.prototype.step = function() {
    this.moveObjects();
    this.checkCollisions();
}

Game.prototype.checkCollisions = function() {
    let len = this.objects.length;
    for (let i = 0; i < len; i++) {
        for (let j = 0; j < len; j++) {
            if (this.objects[i].isCollidedWith(this.objects[j])) {
                if (this.objects[j] instanceof Bullet) {
                    if (i < j) {
                        this.remove(this.objects[j]);
                        this.remove(this.objects[i]);
                    } else {
                        this.remove(this.objects[i]);
                        this.remove(this.objects[j]);
                    }
                    return;
                }
            }
        }
    }
}

// Game.prototype.add = function(obj) {
//     if (obj instanceof Asteroid) this.asteroids.push(obj);
//     else if (obj instanceof Bullet) this.bullets.push(obj);
// }

Game.prototype.remove = function(obj) {
    for (let i = 0; i < this.objects.length; i++) {
        if (this.objects[i].pos[0] === obj.pos[0] 
            && this.objects[i].pos[1] === obj.pos[1])
            this.objects.splice(i, 1);
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