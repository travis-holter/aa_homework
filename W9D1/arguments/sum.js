function sum1(args) {
  let argsArr = Array.from(arguments);
  let result = 0;
  argsArr.forEach(function(el) {
    result += el;
  });
  return result;
}

function sum2(...args) {
  let result = 0;
  args.forEach(function(el) {
    result += el;
  });
  return result;
}