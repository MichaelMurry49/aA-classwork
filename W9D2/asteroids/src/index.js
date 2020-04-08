const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js");


console.log("Webpack is working");
window.addEventListener('DOMContentLoaded', (event) => {

    // const mo = new MovingObject({
    //     pos: [30, 30],
    //     vel: [10, 10],
    //     radius: 5,
    //     color: "red"
    // });

    //const asteroid = new Asteroid([100,100]);
    //const game = new Game();

    // window.MovingObject = MovingObject;
    // window.mo = mo;
    // window.asteroid = asteroid;
    // window.game = game;

    let canvasElement = document.getElementById("game-canvas");
    let ctx = canvasElement.getContext("2d");
    const gameView = new GameView(ctx);

    // mo.draw(ctx);
    // asteroid.draw(ctx);
    //game.draw(ctx);
    gameView.start();

});