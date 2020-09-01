function curriedSum(numArgs){
    const numbers = [];
    function _curriedSum(num){
        numbers.push(num);
        if(numbers.length === numArgs){
          // debugger
            const result = numbers.reduce((acc, ele) => acc + ele);
            debugger
            return result;
        }else{
            return _curriedSum;
        }
    }
    return _curriedSum;
}

// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1));



Function.prototype.curry1 = function(numArgs) {
  const nums = [];
  let func = this;
  function _curried(num) {
    nums.push(num);
    if (nums.length === numArgs) {
      return func(...nums);
    } else {
      return _curried;
    }
  }
  return _curried;
};

Function.prototype.curry2 = function(numArgs) {
  const nums = [];
  let func = this;
  function _curried(num) {
    nums.push(num);
    if (nums.length === numArgs) {
      return func.apply(func, nums);
      // return func.apply(null, nums); // same thing
    } else {
      return _curried;
    }
  }
  return _curried;
};

const dubs = function(a,b,c) {
  return (a + b + c) * 2;
};

// const cSum = dubs.curry2(3);
// cSum(1)(2)(3);


// function randomFunc(arg1, arg2, arg3) {
//   console.log(arg1);
//   console.log(arg2);
//   console.log(arg3);
// }