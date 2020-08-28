let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let new_grid = new Array(8)
  for(i = 0; i < new_grid.length; i++) {
    new_grid[i] = new Array(8)
  }
  new_grid[3][4] = new Piece("black")
  new_grid[4][3] = new Piece("black")
  new_grid[3][3] = new Piece("white")
  new_grid[4][4] = new Piece("white")
  return new_grid
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  for(i = 0; i < pos.length; i++) {
    if( pos[i] < 0 || (pos[i] > 7) ) {
      return false;
    }
  }
  return true;
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  return this.grid[pos[0]][pos[1]]
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if(this.getPiece(pos) === undefined) {
    return false;
  }
  if(this.getPiece(pos).color === color) {
    return true;
  }
  return false;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  if (this.getPiece(pos)) {
    return true;
  }
  return false;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip){
  if(piecesToFlip) {
    piecesToFlip.push(pos);
  }
  else {
    piecesToFlip = [];
  }
  let next_pos = [pos[0]+dir[0],pos[1]+dir[1]];
  // next_pos[0] += dir[0];
  // next_pos[1] += dir[1];
  if(this.isValidPos(next_pos) === false ) {
    return [];
  }
  else if(this.isOccupied(next_pos) === false) {
    return [];
  }
  else if(this.isMine(next_pos, color) === true) {
    return piecesToFlip.length === 0 ? [] : piecesToFlip ;
  }

  else {
    return this._positionsToFlip(next_pos, color, dir, piecesToFlip)
  }
  // if(this.isValidPos(pos) === false) {
  //   return []
  // }
  // let result = [];
  // let bounded = true;
  // let found_end = false
  // while(found_end === false) {
  //   pos[0] += dir[0]
  //   pos[1] += dir[1]
  //   if(this.isValidPos(pos) === false || this.getPiece(pos) === undefined){
  //     bounded = false;
  //     found_end = true;
  //   }
  //   else if(this.isMine(pos, color) === true) {
  //     found_end = true
  //   }
  //   else {
  //     const current_pos = pos.slice(0);
  //     result.push(current_pos);
  //   }

  // }
  // if(bounded === false) {
  //   return []
  // }
  // return result;
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if(this.isOccupied(pos) === true) {
    return false
  }
  for(let i = 0; i < Board.DIRS.length; i++) {
    // my_dir = Board.DIRS.slice(j, j+1);
    if((this._positionsToFlip(pos, color, Board.DIRS[i]).length) > 0) {
      return true
    }
  }
  return false
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};



module.exports = Board;
