const APIUtil = {
    followUser: id => {
        return $.ajax({ 
            method: "POST", 
            url: `/users/${id}/follow`,
            dataType: "JSON" // We changed this to HTML and we were able to follow, but not unfollow. 
            // success: res => { 
            //     debugger
            //     this.followState = true;
            //     this.render();
            // }
        });
    },

    unfollowUser: id => {
        return $.ajax({
            method: "DELETE",
            url: `/users/${id}/follow`,
            dataType: 'JSON'
            // success: res => {
            //     this.followState = false;
            //     this.render();
            // }
        });
    }
};

module.exports = APIUtil;