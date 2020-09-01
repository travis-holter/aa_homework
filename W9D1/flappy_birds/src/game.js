import Level from './level';

export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
  }
  
  animate(ctx) {
    Level.drawBackground(this.ctx);
  }

  restart() {
    const lvl = new Level(this.ctx);
    FlappyBird.animate(this.ctx);
  }
}
