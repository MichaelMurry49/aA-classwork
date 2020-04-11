const FollowToggle = require("./follow_toggle.js");


$(function() {
    const $buttons = $('button.follow-toggle');
    
    for (let i = 0; i < $buttons.length; i++) {
        new FollowToggle($buttons[i]);
    }
});