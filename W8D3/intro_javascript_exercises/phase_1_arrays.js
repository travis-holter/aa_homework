Array.prototype.uniq = function() {
    // debugger
    let uniq_array = [];
    this.forEach(function(el) {
        if (!uniq_array.includes(el)) {
            uniq_array.push(el)
        }
    })
    return uniq_array
}

// console.log(([1,2,2,3,3,3].uniq())); //  => [1,2,3])

Array.prototype.twoSum = function() {
    // debugger
    let indicies = [];
    let compliments = {};
    let i = 0;
    this.forEach(function(el) {
        if (compliments[el] !== undefined) {
            indicies.push(compliments[el]);
            indicies.push(i);
        }
        compliments[0 - el] = i;
        i++
    })
    return indicies;
}
// console.log(([1,2,-1].twoSum()));
// console.log(([1,2,3,-3].twoSum()));
// console.log(([0,3].twoSum()));

Array.prototype.transpose = function() {
    debugger
    let max_length = this.length;
    let answer = []
    for(let i = 0; i < this[0].length; i++) {
        let sub_arr = [];
        for(let r = 0; r < max_length; r++) {
            sub_arr.push(this[r][i])
        }
        answer.push(sub_arr)
    }
    return answer
}
// console.log([[1,2],[3,4],[5,6]].transpose())
