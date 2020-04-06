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
    let bindArgs = Array.from(arguments).slice(1);
    let func = () => {
        let callArgs = Array.from(arguments);
        this.apply(context, bindArgs.concat(callArgs));
    }
    return func;
};

Function.prototype.myBind2 = function (context, ...bindArgs) {
    let func = (...args) => this.apply(context, bindArgs.concat(args));
    return func;
};

// class Cat {
//     constructor(name) {
//         this.name = name;
//     }

//     says(sound, person) {
//         console.log(`${this.name} says ${sound} to ${person}!`);
//         return true;
//     }
// }

// class Dog {
//     constructor(name) {
//         this.name = name;
//     }
// }

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind2(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind2(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind2(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind2(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true

const curry1 = function(numArgs) {
    let numbers = [];
    function _curriedSum(n) {
        numbers.push(n);
        if (numbers.length === numArgs) {
            let sum = 0;
            for (let num of numbers) sum += num;
            return sum;
        }
        return _curriedSum;
    }
    return _curriedSum;
}

// const total = curry(4);
// console.log(total(5)(30)(20)(1)); // => 56

Function.prototype.curry = function(numArgs) {

    const args = [];
    const _curry = (arg) => {
        args.push(arg);
        if (numArgs === args.length) {
            return this(...args);
        } else {
            return _curry;
        }
    }
    return _curry;
}