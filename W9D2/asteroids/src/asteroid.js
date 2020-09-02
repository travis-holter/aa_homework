import MovingObject from './moving_object.js';
function Asteroid(){
    this.COLOR = "grey";
    this.RADIUS = 150;
}

Asteroid.inherits(MovingObject);