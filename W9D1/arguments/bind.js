Function.prototype.myBind1 = function (context, args) {
  let that = this;
  let bindArgs = Array.from(arguments);
  return function(args) {
    let callArgs = Array.from(arguments);
    return that.apply(context, bindArgs.concat(callArgs));
  };
};

Function.prototype.myBind2 = function(context, ...bindArgs) {
  let that = this;
  return function(...callArgs) {
    return that.apply(context, bindArgs.concat(callArgs));
  };
};

function myFunc() {
    console.log(`${this} is a thing`);
}
let arr = ['howdy'];
myFunc.myBind1(arr, 'whatever');


