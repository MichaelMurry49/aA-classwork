/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\nfunction Asteroid(pos, game) {\n    \n    const asteroidProperties = {\n        pos: pos,\n        vel: Util.randomVec(5),\n        radius: Asteroid.RADIUS,\n        color: Asteroid.COLOR,\n        game: game\n    }\n    MovingObject.call(this, asteroidProperties);\n}\nAsteroid.RADIUS = 30;\nAsteroid.COLOR = \"gray\";\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\n\nfunction Game() {\n    this.asteroids = [];\n    this.addAsteroids();\n}\n\nGame.prototype.addAsteroids = function () {\n    let i = 0;\n    while (i < Game.NUM_ASTEROIDS) {\n        let asteroid = new Asteroid(this.randomPosition(), this);\n        this.asteroids.push(asteroid);\n        i++;\n    }\n}\n\nGame.prototype.randomPosition = function () {\n    let x = Math.floor(Math.random() * Game.DIM_X);\n    let y = Math.floor(Math.random() * Game.DIM_Y);\n    return [x, y];\n}\n\nGame.prototype.draw = function (ctx) {\n    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);\n    this.asteroids.forEach((asteroid) => asteroid.draw(ctx));\n}\n\nGame.prototype.moveObjects = function () {\n    for (let i = 0; i < this.asteroids.length; i++) {\n        this.asteroids[i].move();\n    }\n}\n\nGame.prototype.wrap = function (pos) {\n    if (pos[0] > Game.DIM_X) {\n        pos[0] = 0;\n    }\n    else if (pos[0] < 0) {\n        pos[0] = Game.DIM_X;\n    }\n    if (pos[1] > Game.DIM_Y) {\n        pos[1] = 0;\n    }\n    else if (pos[1] < 0) {\n        pos[1] = Game.DIM_Y;\n    }\n    return pos;\n}\n\nGame.DIM_X = 900;\nGame.DIM_Y = 600;\nGame.NUM_ASTEROIDS = 10;\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView(ctx) {\n    this.game = new Game();\n    this.ctx = ctx;\n}\n\nGameView.prototype.start = function () {\n    setInterval(() => {\n        this.game.moveObjects();\n        this.game.draw(this.ctx);\n    }, 20)\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\n\n\nconsole.log(\"Webpack is working\");\nwindow.addEventListener('DOMContentLoaded', (event) => {\n\n    // const mo = new MovingObject({\n    //     pos: [30, 30],\n    //     vel: [10, 10],\n    //     radius: 5,\n    //     color: \"red\"\n    // });\n\n    //const asteroid = new Asteroid([100,100]);\n    //const game = new Game();\n\n    // window.MovingObject = MovingObject;\n    // window.mo = mo;\n    // window.asteroid = asteroid;\n    // window.game = game;\n\n    let canvasElement = document.getElementById(\"game-canvas\");\n    let ctx = canvasElement.getContext(\"2d\");\n    const gameView = new GameView(ctx);\n\n    // mo.draw(ctx);\n    // asteroid.draw(ctx);\n    //game.draw(ctx);\n    gameView.start();\n\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(obj) {\n    console.log(obj)\n    this.pos = obj.pos;\n    this.vel = obj.vel;\n    this.radius = obj.radius;\n    this.color = obj.color;\n    this.game = obj.game;\n}\n\nMovingObject.prototype.draw = function (ctx) {\n    ctx.beginPath();\n    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);\n    ctx.fillStyle = this.color;\n    ctx.fill();\n    ctx.stroke();\n}\n\nMovingObject.prototype.move = function () {\n    this.pos[0] += this.vel[0];\n    this.pos[1] += this.vel[1];\n    this.pos = this.game.wrap(this.pos);\n}\n\nMovingObject.prototype.isCollidedWith = function (otherObject) {\n    //collision if center1 - center2 < radius1 + radius2\n    //distance => Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)\n    // distance = sqrt((this.pos[0] - otherObject.pos[0]) ** 2 + (this.post[1] - otherObject.pos[1]) ** 2)\n    // if () {\n\n    // }\n}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n    inherits(child, parent) {\n        function Surrogate() { }\n        Surrogate.prototype = parent.prototype;\n        child.prototype = new Surrogate();\n        child.prototype.constructor = child;\n    },\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n}\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });