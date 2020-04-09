const Game = require("./game.js");

function GameView(ctx) {
    this.game = new Game();
    this.ctx = ctx;
}

GameView.prototype.bindKeyHandlers = function() {
    key('w', function () { alert('you pressed w!') });
    key('a', function () { alert('you pressed a!') });
    key('s', function () { alert('you pressed s!') });
    key('d', function () { alert('you pressed d!') });
}

GameView.prototype.start = function () {
    this.bindKeyHandlers();
    setInterval(() => {
        this.game.step();
        this.game.draw(this.ctx);
    }, 20)
}

module.exports = GameView;