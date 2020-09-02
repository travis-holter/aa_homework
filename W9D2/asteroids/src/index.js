console.log("Hello")
const MovingObject = require("./moving_object.js");
window.MovingObject = MovingObject;

document.addEventListener("DOMContentLoaded", () => {
    

    // debugger
    const canvEle = document.getElementById("game-canvas");
    canvEle.width = 500;
    canvEle.height = 500;
    const ctx = canvEle.getContext("2d");
    ctx.fillStyle = "black";
    ctx.fillRect(0, 0, 500, 500);

    let orb = new MovingObject({
        pos: [50, 50],
        vel: [5, 5],
        radius: 50,
        color: "blue"
    });
    orb.draw(ctx);

    // ctx.beginPath();
    // ctx.strokeStyle = "blue";
    // ctx.arc(250, 250, 80, 0, 2 * Math.PI);
    // ctx.stroke();
});
