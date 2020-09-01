import FlappyBird from './game';

const canvas = document.getElementById('bird-game');
const bird = new FlappyBird(canvas);
bird.restart();

console.log("something");