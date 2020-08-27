Array.prototype.bubbleSort = function() {
    let sorted = false
    // debugger
    while (sorted === false){
        sorted = true
        for( let i = 0; i < this.length - 1; i++){
            if (this[i] > this[i+1]) {
                [this[i], this[i + 1]] = [this[i + 1], this[i]]
                sorted = false
            }
        }
    }
    return this
}


// console.log([2,3,1,4,7,2].bubbleSort())

String.prototype.substrings = function() {
    let subs = [];
    for(i = 0; i < this.length; i++) {
        for(r = i; r <= this.length; r++) {
            if(i !== r){
                subs.push(this.substring(i,r))
            }
        }
    }
    return subs
}

// console.log("hello".substrings())