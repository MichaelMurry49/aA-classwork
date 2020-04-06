function sum() {
    let ans = 0;

    for (let i = 0; i < arguments.length; i++) {
        ans += arguments[i];
    }

    return ans
};

function sum2(...args) {
    let ans = 0;

    for (let i = 0; i < args.length; i++) {
        ans += args[i];
    }

    return ans
};

// console.log(sum2(1, 2, 3, 4))
// console.log(sum2(1, 2, 3, 4, 5))

Function.prototype.myBind = function(context) {
    let func = (arguments) => this.apply(context, arguments);
    return func;
};

