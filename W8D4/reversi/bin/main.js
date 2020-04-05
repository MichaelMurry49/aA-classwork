// const Game = require("../lib/game");

/**
 * Initializes the Piece with its color.
 */
function Piece(color) {
    this.color = color;
}

/**
 * Returns the color opposite the current piece.
 */
Piece.prototype.oppColor = function () {
    if (this.color === 'white') {
        return 'black';
    } else {
        return 'white';
    }
};

/**
 * Changes the piece's color to the opposite color.
 */
Piece.prototype.flip = function () {
    this.color = this.oppColor();
};

/**
 * Returns a string representation of the string
 * based on its color.
 */
Piece.prototype.toString = function () {
    if (this.color === 'black') {
        return 'B';
    } else {
        return 'W';
    }
};

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid() {
    let grid = [];
    for (let i = 0; i < 8; i++) {
        let subarray = [];
        for (let j = 0; j < 8; j++) {
            subarray.push(undefined);

        };
        grid.push(subarray);
    };
    grid[3][4] = new Piece('black');
    grid[4][3] = new Piece('black');
    grid[3][3] = new Piece('white');
    grid[4][4] = new Piece('white');
    return grid
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board() {
    this.grid = _makeGrid();
}

Board.DIRS = [
    [0, 1], [1, 1], [1, 0],
    [1, -1], [0, -1], [-1, -1],
    [-1, 0], [-1, 1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */

Board.prototype.getPiece = function (pos) {

    let posOne = pos[0];
    let posTwo = pos[1];

    if (this.isValidPos(pos)) {
        return this.grid[posOne][posTwo];
    } 
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
    return this.validMoves(color).length > 0
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
    if (this.isOccupied(pos)) {
        return (this.grid[pos[0]][pos[1]].color === color);
    }
    return false;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
    return !!this.grid[pos[0]][pos[1]]
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
    return !this.hasMove('black') && !this.hasMove('white');
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
    return (pos[0] >= 0 && pos[1] >= 0) && (pos[0] < 8 && pos[1] < 8)
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip(board, pos, color, dir, piecesToFlip) {
    if (!board.isValidPos(pos) || !board.isOccupied(pos)) return null;
    if (piecesToFlip.length === 0 && board.isMine(pos, color)) return null;

    if (board.isMine(pos, color)) return piecesToFlip;
    piecesToFlip.push(board.grid[pos[0]][pos[1]]);
    let newPos = [pos[0] + dir[0], pos[1] + dir[1]];
    return _positionsToFlip(board, newPos, color, dir, piecesToFlip);
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
    if (this.validMove(pos, color)) {
        this.grid[pos[0]][pos[1]] = new Piece(color);
        for (let i = 0; i < Board.DIRS.length; i++) {
            let newPos = [pos[0] + Board.DIRS[i][0], pos[1] + Board.DIRS[i][1]];
            let captured = _positionsToFlip(this, newPos, color, Board.DIRS[i], []);
            if (captured === null) continue;
            for (let flip of captured) {
                flip.color = color;
            }
        }
        return true;
    } 
    return false;
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
    let whiteScore = 0;
    let blackScore = 0;
    for (var i = 0; i < 8; i++) {
        for (var j = 0; j < 8; j++) {
            let idNum = i * 8 + j;
            if (this.grid[i][j] !== undefined) {
                if (this.grid[i][j].color === 'white') whiteScore++;
                if (this.grid[i][j].color === 'black') blackScore++;
                let span = document.getElementById(`pos${idNum}`).querySelector('span');
                span.classList = "";
                span.classList.add(`${this.grid[i][j].color}-disc`)
            }
        }
    }
    document.querySelector('.white .score').innerHTML = whiteScore;
    document.querySelector('.black .score').innerHTML = blackScore;
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
    if (this.isOccupied(pos)) return false;
    for (let i = 0; i < Board.DIRS.length; i++) {
        let newPos = [pos[0] + Board.DIRS[i][0], pos[1] + Board.DIRS[i][1]];
        if ((_positionsToFlip(this, newPos, color, Board.DIRS[i], [])) !== null) {
            return true;
        }
    }
    return false
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
    let validPositions = [];
    for (let i = 0; i < 8; i++) {
        for (let j = 0; j < 8; j++) {
            if (this.validMove([i, j], color)) {
                validPositions.push([i, j]);
            };
        };

    };
    return validPositions;
};

/**
 * Sets up the game with a board and the first player to play a turn.
 */
function Game() {
    this.board = new Board();
    this.turn = "black";
};

/**
 * Flips the current turn to the opposite color.
 */
Game.prototype._flipTurn = function () {
    document.querySelector(`.${this.turn}`).querySelector('.turn').innerHTML = "";
    this.turn = (this.turn == "black") ? "white" : "black";
    document.querySelector(`.${this.turn}`).querySelector('.turn').innerHTML = "It's your turn!";
};

/**
 * Creates a readline interface and starts the run loop.
 */
Game.prototype.play = function () {
    const grid = document.querySelector('.grid');
    this.init();
};

Game.prototype.init = function(){
    this.board.print();
    let cells = document.querySelectorAll('.cell');
    for (let i = 0; i < cells.length; i++) {
        cells[i].addEventListener('click', () => this.gameLoop());
    }
}

Game.prototype.gameLoop = function() {
    let cellNum = parseInt(event.srcElement.id.slice(3));
    if (this.board.placePiece([parseInt(cellNum / 8), cellNum % 8], this.turn)) {
        this.board.print();
        this._flipTurn();
    }   
    if (this.board.isOver()) {
        alert("The game is over!");
    } 
    if (!this.board.hasMove(this.turn)) {
        this._flipTurn();
    } 
}

const game = new Game();
game.play();
