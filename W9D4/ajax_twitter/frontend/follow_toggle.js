class FollowToggle {
    constructor(el){
        debugger
        this.$el = $(el);
        debugger
        this.userId = this.$el.data("userId");
        this.followState = this.$el.data("initialFollowState");
        this.render(this.$el);
    }

    render($el){
        debugger
        if (this.followState === "unfollowed") {
            return $el.text("Follow!");
        } else {
            return $el.text("Unfollow!");
        }
    }

    handleClick($el) {
        $el.on('click', e => {
            e.preventDefault();
            if (this.followState === 'followed') {
                return $.ajax({
                    method:'POST',
                    url: '/users/:id/follow',
                    success: $el => {
                        render($el);
                })
            }
            // if we are following (this.followState === "followed")
            //  ajax request to unfollow
            //else (means we are not following)
            //  ajax request to follow
        })


    }

// const setEventHandlers = () => {
//   $('#new-gif-form').on('submit', e => {
//     e.preventDefault();
//     fetchNewGif();
//   });

//   $("#save-gif-form").on("submit", e => {
//     e.preventDefault();
//     saveGif();
//   });


// const fetchSavedGifAJAX = queryString => {
//   return $.ajax({
//   method: 'GET',
//     url: `/gifs/${queryString}`,
//     success: gif => {
//       debugger;
//       appendGif(gif.url);
//     },
//     error: response => {
//       debugger;
//       postMessage(response.responseJSON[0]);
//     }
//   });
// };






}
// data - initial - follow - state



module.exports = FollowToggle;


// class Rectangle {
//     constructor(height, width) {
//         this.height = height;
//         this.width = width;
//     }
// }