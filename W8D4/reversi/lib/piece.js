/**
 * Initializes the Piece with its color.
 */
function Piece (color) {
    this.color = color;
}

/**
 * Returns the color opposite the current piece.
 */
Piece.prototype.oppColor = function () {
    if (this.color === "white") {
        return 'black'
    }
    if (this.color === "black") {
        return 'white'
    }
};

/**
 * Changes the piece's color to the opposite color.
 */
Piece.prototype.flip = function () {
    if(this.color === "black") {
        this.color = "white"
    }
    else if(this.color === "white") {
        this.color = "black"
    }
};

/**
 * Returns a string representation of the string
 * based on its color.
 */
Piece.prototype.toString = function () {
    if(this.color === "white") {
        return 'W'
    }
    if(this.color === "black") {
        return 'B'
    }
};

module.exports = Piece;
