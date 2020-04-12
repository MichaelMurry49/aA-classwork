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

/***/ "./src/apple.js":
/*!**********************!*\
  !*** ./src/apple.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Coord = __webpack_require__(/*! ./coord.js */ \"./src/coord.js\");\n\nclass Apple {\n\n    constructor() {\n        let x = Math.floor(Math.random() * BOARD_ROWS) + 1;\n        let y = Math.floor(Math.random() * BOARD_COLS) + 1;\n        this.coord = new Coord(x, y);\n    }\n}\n\nconst BOARD_COLS = 39;\nconst BOARD_ROWS = 29;\nmodule.exports = Apple;\n\n//# sourceURL=webpack:///./src/apple.js?");

/***/ }),

/***/ "./src/coord.js":
/*!**********************!*\
  !*** ./src/coord.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class Coord {\n\n    constructor(x, y) {\n        this.x = x;\n        this.y = y;\n    }\n}\n\nmodule.exports = Coord;\n\n//# sourceURL=webpack:///./src/coord.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Snake = __webpack_require__(/*! ./snake.js */ \"./src/snake.js\");\nconst Apple = __webpack_require__(/*! ./apple.js */ \"./src/apple.js\");\nconst Coord = __webpack_require__(/*! ./coord.js */ \"./src/coord.js\");\nlet currentDir = [-1, 0];\n\nconst setup = () => {\n    bindKeyHandlers();\n    $('figure').append(creatBoard());\n    let snake = new Snake();\n    let apple = new Apple();\n    update(snake, apple);\n}\n\nconst update = (snake, apple) => {\n    setInterval(() => {\n        clearPos(snake);\n        if (ateApple(snake, apple)) {\n            apple = new Apple();\n            let tail = snake.body[snake.len - 1];\n            snake.len++;\n            console.log(snake.body)\n            snake.move(currentDir);\n            snake.body.push(new Coord(tail.x, tail.y));\n        } else snake.move(currentDir);\n        draw(snake);\n        draw(apple);\n    }, 150);\n}\n\nconst ateApple = (snake, apple) => {\n    if (snake.body[0].x === apple.coord.x \n        && snake.body[0].y === apple.coord.y) {\n            clearPos(apple);\n            return true;\n        }\n    return false;\n}\n\nconst appendToTail = (snake) => {\n\n}\n\nconst clearPos = (obj) => {\n    if (obj instanceof Apple) {\n        $(`ul:nth-child(${obj.coord.x}) li:nth-child(${obj.coord.y})`).removeClass(\"apple\")\n    }\n    else {\n        // for (coord of obj.body) {\n            let coord = obj.body[obj.len - 1];\n            $(`ul:nth-child(${coord.x}) li:nth-child(${coord.y})`).removeClass(\"seg\");\n        // }\n    } \n}\n\nconst draw = (obj) => {\n    let x = null, y = null, css = null;\n    if (obj instanceof Snake) {\n        xHead = obj.body[0].x;\n        xTail = obj.body[obj.len - 1].x;\n        yHead = obj.body[0].y;\n        yTail = obj.body[obj.len - 1].y;\n        css = 'seg'\n        _draw(xHead, yHead, css);\n        if (obj.body.length !== 1)\n        _draw(xTail, yTail, css);\n    } else {\n        x = obj.coord.x;\n        y = obj.coord.y;\n        css = 'apple';\n        _draw(x, y, css);\n    }\n    \n}\n\nconst _draw = (x, y, css) => {\n    $(`ul:nth-child(${x}) li:nth-child(${y})`).addClass(`${css}`);\n}\n\nconst bindKeyHandlers = () => {\n    $(document).keydown(function (e) {\n        switch (e.which) {\n            case 37: currentDir = [0, -1];\n                break;\n            case 38: currentDir = [-1, 0];\n                break;\n            case 39: currentDir = [0, 1];\n                break;\n            case 40: currentDir = [1, 0];\n                break;\n            default: return; \n        }\n        e.preventDefault(); \n    });\n}\n\nconst creatBoard = () => {\n    let board = '';\n    for (let i = 0; i < 30; i++) {\n        board += '<ul>';\n       for (let j =0; j < 40; j++) {\n           board += '<li></li>';\n       }\n       board += '</ul>'\n    }\n    return board;\n}\n\n$(setup);\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/snake.js":
/*!**********************!*\
  !*** ./src/snake.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Coord = __webpack_require__(/*! ./coord.js */ \"./src/coord.js\");\n\nclass Snake {\n    constructor() {\n        this.body = [];\n        this.coord = new Coord(START_X, START_Y);\n        this.body.push(this.coord);\n        this.len = 1;\n    }\n\n    move(dir) {\n        for (let i = 1; i < this.body.length; i++) {\n            this.body[i]= new Coord(this.body[i - 1].x, this.body[i - 1].y)\n        }\n        this.body[0].x += dir[0];\n        this.body[0].y += dir[1];\n    }\n}\n\nconst START_X = 23;\nconst START_Y = 20;\n\nmodule.exports = Snake;\n\n//# sourceURL=webpack:///./src/snake.js?");

/***/ })

/******/ });