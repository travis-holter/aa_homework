const FollowToggle = require("./follow_toggle.js");











$(() => {
    $("button.follow-toggle").each((i, ele) => new FollowToggle(ele) )
    
});
