const Snake = require('./snake.js');
const Apple = require('./apple.js');
const Coord = require('./coord.js');
let currentDir = [-1, 0];

const setup = () => {
    bindKeyHandlers();
    $('figure').append(creatBoard());
    let snake = new Snake();
    let apple = new Apple();
    update(snake, apple);
}

const update = (snake, apple) => {
    setInterval(() => {
        clearPos(snake);
        if (ateApple(snake, apple)) {
            apple = new Apple();
            let tail = snake.body[snake.len - 1];
            snake.len++;
            console.log(snake.body)
            snake.move(currentDir);
            snake.body.push(new Coord(tail.x, tail.y));
        } else snake.move(currentDir);
        draw(snake);
        draw(apple);
    }, 150);
}

const ateApple = (snake, apple) => {
    if (snake.body[0].x === apple.coord.x 
        && snake.body[0].y === apple.coord.y) {
            clearPos(apple);
            return true;
        }
    return false;
}

const appendToTail = (snake) => {

}

const clearPos = (obj) => {
    if (obj instanceof Apple) {
        $(`ul:nth-child(${obj.coord.x}) li:nth-child(${obj.coord.y})`).removeClass("apple")
    }
    else {
        // for (coord of obj.body) {
            let coord = obj.body[obj.len - 1];
            $(`ul:nth-child(${coord.x}) li:nth-child(${coord.y})`).removeClass("seg");
        // }
    } 
}

const draw = (obj) => {
    let x = null, y = null, css = null;
    if (obj instanceof Snake) {
        xHead = obj.body[0].x;
        xTail = obj.body[obj.len - 1].x;
        yHead = obj.body[0].y;
        yTail = obj.body[obj.len - 1].y;
        css = 'seg'
        _draw(xHead, yHead, css);
        if (obj.body.length !== 1)
        _draw(xTail, yTail, css);
    } else {
        x = obj.coord.x;
        y = obj.coord.y;
        css = 'apple';
        _draw(x, y, css);
    }
    
}

const _draw = (x, y, css) => {
    $(`ul:nth-child(${x}) li:nth-child(${y})`).addClass(`${css}`);
}

const bindKeyHandlers = () => {
    $(document).keydown(function (e) {
        switch (e.which) {
            case 37: currentDir = [0, -1];
                break;
            case 38: currentDir = [-1, 0];
                break;
            case 39: currentDir = [0, 1];
                break;
            case 40: currentDir = [1, 0];
                break;
            default: return; 
        }
        e.preventDefault(); 
    });
}

const creatBoard = () => {
    let board = '';
    for (let i = 0; i < 30; i++) {
        board += '<ul>';
       for (let j =0; j < 40; j++) {
           board += '<li></li>';
       }
       board += '</ul>'
    }
    return board;
}

$(setup);