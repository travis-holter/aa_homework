function range(start, end) {
    if (start === end) {
        return [start]
    }
    return [start].concat(range(start+1, end))
}

// console.log(range(1,7))

function sumRec(array) {
    if (array.length === 1) {
        return array[0]
    }
    return array[0] + sumRec(array.slice(1))
}

// console.log(sumRec([1,2,3,5,78889]))

function recExponent(base, exp) {
    if (exp === 0) {
        return 1
    }
    // if (exp === 1) {
    //     return b
    // }

    return base * recExponent(base, exp - 1)

}

function recExponent2(base, exp) {
    if (exp === 0) {
        return 1
    }
    if (exp === 1) {
        return b
    }

    if (exp % 2 === 0)  {
        return recExponent(base, (exp / 2)) ** 2
    }
    else {
        return base * recExponent(base, (exp - 1) / 2) ** 2
    }
}

console.log(recExponent2(5,-4))