const Game = require("./game.js");

function GameView(ctx) {
    this.game = new Game();
    this.ctx = ctx;
}

GameView.prototype.bindKeyHandlers = function() {
    let self = this;
    key('w', function () { self.game.ship.power([0, -1]) });
    key('a', function () { self.game.ship.power([-1, 0]) });
    key('s', function () { self.game.ship.power([0, 1]) });
    key('d', function () { self.game.ship.power([1, 0]) });
    key('space', function () { self.game.ship.fireBullet() });
}

GameView.prototype.start = function () {
    this.bindKeyHandlers();
    setInterval(() => {
        this.game.step();
        this.game.draw(this.ctx);
    }, 20)
}

module.exports = GameView;