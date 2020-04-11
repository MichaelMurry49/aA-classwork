const APIUtil = require('./api_util.js');

class FollowToggle {

    constructor(el) {
        this.$el = $(el);
        this.userId = this.$el.data("user-id"); // No second arg is getter, second arg means setter
        this.followState = this.$el.data("initial-follow-state");
        // debugger
        this.render();
        // this.handleClick();
        this.$el.on("click", e => this.handleClick(e));
    }

    render() {
        if (this.followState === false) {
            this.$el.text("Follow!"); 
        } else if (this.followState === true) { 
            this.$el.text("Unfollow!"); 
        }
    }

    // handleClick() {
    //     // debugger
    //     this.$el.on("click", e => {
    //         // debugger
    //         e.preventDefault();
    //         if (this.followState === false) {
    //             this.followUser();
    //         } else {
    //             this.unfollowUser();
    //         }
    //     })
    // }

    handleClick(e) {
        e.preventDefault();
        if (this.followState === false) {

            APIUtil.followUser(this.userId)
            .then(res => { 
                this.followState = true;
                this.render();
            });
        } else {
            APIUtil.unfollowUser(this.userId)
            .then(res => {
                this.followState = false;
                this.render();
            });
        }
    }

    // followUser() {
    //     return $.ajax({ 
    //         method: "POST", 
    //         url: `/users/${this.userId}/follow`,
    //         dataType: "JSON", // We changed this to HTML and we were able to follow, but not unfollow. 
    //         success: res => { 
    //             // debugger
    //             this.followState = true;
    //             this.render();
    //         }
    //     });
    // }

    // unfollowUser() {
    //     return $.ajax({
    //         method: "DELETE",
    //         url: `/users/${this.userId}/follow`,
    //         dataType: 'JSON',
    //         success: res => {
    //             this.followState = false;
    //             this.render();
    //         }
    //     })
    // }
}


module.exports = FollowToggle;