Array.prototype.myEach = function(cb) {
    let max_length = this.length
    for (let i = 0; i < max_length; i++) {
        cb(this[i])
    }
    return undefined
}

add5 = function(num) {
    return num + 5
};

// [1,2,3,4].myEach(add5)

Array.prototype.myMap = function(cb) {
    answer = [];
    this.myEach(function(el) {
        answer.push(cb(el))
    })
    return answer
}

// console.log([7,12].myMap(add5))

Array.prototype.myReduce = function(cb, acc = 0) {
    // debugger
    this.myEach(function(el) {
        acc = cb(acc, el);
    })
    return acc;
}

// console.log([1, 2, 3].myReduce(function(acc, el) {
//     return acc + el;
// })) // 6

// console.log([1, 2, 3].myReduce(function(acc, el) {
//     return acc + el;
// }, 25)) // 31

// console.log([1,2,3,4,5].myReduce(add5))