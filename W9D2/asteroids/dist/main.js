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

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\n\nfunction Asteroid(pos, game) {\n    \n    const asteroidProperties = {\n        pos: pos,\n        vel: Util.randomVec(5),\n        radius: Asteroid.RADIUS,\n        color: Asteroid.COLOR,\n        game: game\n    }\n    MovingObject.call(this, asteroidProperties);\n}\nUtil.inherits(Asteroid, MovingObject);\n\nAsteroid.prototype.isCollidedWith = function(otherObject) {\n    distance = Math.sqrt((this.pos[0] - otherObject.pos[0]) ** 2 + (this.pos[1] - otherObject.pos[1]) ** 2)\n    if (distance < this.radius + otherObject.radius) {\n        if (otherObject instanceof Ship) otherObject.relocate();\n        return true;\n    }\n    return false;\n}\n\nAsteroid.RADIUS = 30;\nAsteroid.COLOR = \"gray\";\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/bullet.js":
/*!***********************!*\
  !*** ./src/bullet.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\nfunction Bullet(pos, vel, game) {\n    let options = {\n        pos: [...pos],\n        vel: getVel(vel),\n        radius: Bullet.RADIUS,\n        color: Bullet.COLOR,\n        game: game\n    };\n    MovingObject.call(this, options);\n}\n\nfunction getVel(vel) { \n    let vx = vel[0], vy = vel[1];\n    if (vy === 0 && vx === 0) return [0, -7];\n    vx = vel[0] * 5;\n    vy = vel[1] * 5;\n    return [vx, vy];\n}\nUtil.inherits(Bullet, MovingObject);\n\nBullet.prototype.isWrappable = false;\n\nBullet.RADIUS = 3;\nBullet.COLOR = \"blue\";\n\n\nmodule.exports = Bullet;\n\n//# sourceURL=webpack:///./src/bullet.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\");\n\nfunction Game() {\n    this.asteroids = [];\n    this.ship = new Ship( this);\n    this.addAsteroids();\n    this.objects = this.allObjects();\n    this.bullets = [];\n}\n\nGame.prototype.addAsteroids = function () {\n    let i = 0;\n    while (i < Game.NUM_ASTEROIDS) {\n        let asteroid = new Asteroid(this.randomPosition(), this);\n        this.asteroids.push(asteroid);\n        i++;\n    }\n}\n\nGame.prototype.randomPosition = function () {\n    let x = Math.floor(Math.random() * Game.DIM_X);\n    let y = Math.floor(Math.random() * Game.DIM_Y);\n    return [x, y];\n}\n\nGame.prototype.draw = function (ctx) {\n    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);\n    for (let object of this.objects) object.draw(ctx);\n}\n\nGame.prototype.moveObjects = function () {\n    for (let i = 0; i < this.objects.length; i++) {\n        let object = this.objects[i];\n        object.move();\n        if (this.isOutOfBounds(object.pos)) {\n            if (object instanceof Bullet)\n                this.objects.splice(i, 1);\n        }\n    }\n}\n\nGame.prototype.wrap = function(pos) {\n    if (pos[0] > Game.DIM_X) pos[0] = 0;\n    else if (pos[0] < 0) pos[0] = Game.DIM_X;\n    \n    if (pos[1] > Game.DIM_Y) pos[1] = 0;\n    else if (pos[1] < 0) pos[1] = Game.DIM_Y;\n    \n    return pos;\n}\n\nGame.prototype.isOutOfBounds = function(pos) {\n    return pos[0] < 0 || pos[1] < 0 || pos[0] > Game.DIM_X || pos[1] > Game.DIM_Y;\n}\n\nGame.prototype.step = function() {\n    this.moveObjects();\n    this.checkCollisions();\n}\n\nGame.prototype.checkCollisions = function() {\n    let len = this.objects.length;\n    for (let i = 0; i < len; i++) {\n        for (let j = 0; j < len; j++) {\n            if (this.objects[i].isCollidedWith(this.objects[j])) {\n                if (this.objects[j] instanceof Bullet) {\n                    if (i < j) {\n                        this.remove(this.objects[j]);\n                        this.remove(this.objects[i]);\n                    } else {\n                        this.remove(this.objects[i]);\n                        this.remove(this.objects[j]);\n                    }\n                    return;\n                }\n            }\n        }\n    }\n}\n\n// Game.prototype.add = function(obj) {\n//     if (obj instanceof Asteroid) this.asteroids.push(obj);\n//     else if (obj instanceof Bullet) this.bullets.push(obj);\n// }\n\nGame.prototype.remove = function(obj) {\n    for (let i = 0; i < this.objects.length; i++) {\n        if (this.objects[i].pos[0] === obj.pos[0] \n            && this.objects[i].pos[1] === obj.pos[1])\n            this.objects.splice(i, 1);\n    }\n}\n\nGame.prototype.allObjects = function() {\n    let objects = [];\n    objects = objects.concat(this.asteroids);\n    objects.push(this.ship);\n    return objects;\n}\n\nGame.DIM_X = 900;\nGame.DIM_Y = 600;\nGame.NUM_ASTEROIDS = 7;\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView(ctx) {\n    this.game = new Game();\n    this.ctx = ctx;\n}\n\nGameView.prototype.bindKeyHandlers = function() {\n    let self = this;\n    key('w', function () { self.game.ship.power([0, -1]) });\n    key('a', function () { self.game.ship.power([-1, 0]) });\n    key('s', function () { self.game.ship.power([0, 1]) });\n    key('d', function () { self.game.ship.power([1, 0]) });\n    key('space', function () { self.game.ship.fireBullet() });\n}\n\nGameView.prototype.start = function () {\n    this.bindKeyHandlers();\n    setInterval(() => {\n        this.game.step();\n        this.game.draw(this.ctx);\n    }, 20)\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

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

eval("function MovingObject(obj) {\n    this.pos = obj.pos;\n    this.vel = obj.vel;\n    this.radius = obj.radius;\n    this.color = obj.color;\n    this.game = obj.game;\n}\n\nMovingObject.prototype.draw = function (ctx) {\n    ctx.beginPath();\n    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);\n    ctx.fillStyle = this.color;\n    ctx.fill();\n}\n\nMovingObject.prototype.move = function () {\n    this.pos[0] += this.vel[0];\n    this.pos[1] += this.vel[1];\n    if (this.isWrappable) this.pos = this.game.wrap(this.pos);\n}\n\nMovingObject.prototype.isWrappable = true;\n\nMovingObject.prototype.isCollidedWith = function(otherObject) {}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\");\n\nShip.RADIUS = 10;\nShip.COLOR = \"white\";\n\nfunction Ship(game) {\n    let options = {\n        pos: game.randomPosition(),\n        vel: Util.randomVec(0),\n        radius: Ship.RADIUS,\n        color: Ship.COLOR,\n        game: game\n    };\n    MovingObject.call(this, options);\n}\nUtil.inherits(Ship, MovingObject);\n\nShip.prototype.relocate = function() {\n    this.pos = this.game.randomPosition();\n}\n\nShip.prototype.power = function(impuse) {\n    this.vel[0] += impuse[0];\n    this.vel[1] += impuse[1];\n}\n\nShip.prototype.fireBullet = function() {\n    let bullet = new Bullet(this.pos, this.vel, this.game);\n    this.game.bullets.push(bullet)\n    this.game.objects.push(bullet);\n}\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

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