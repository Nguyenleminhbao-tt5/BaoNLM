class FollowsController < ApplicationController


    def create
        user = User.find(params[:id])
        @follow = Follow.new(following_id: current_user.id, follower_id: user.id)
        respond_to do |format|
            format.html do
                if @follow.save
                    flash[:success] = "Follow successfully"

                    redirect_to  profile_followings_url(current_user)
                    
                else
                    flash.now[:error] = "Follow failed"
                
                end
            end
        end
    end


    def destroy
        user_unfollow = User.find(params[:id])
        @follow= current_user.follows_as_follower.find_by follower_id: user_unfollow.id
        @follow.destroy
        flash[:success] = "Unfollow success ."
        redirect_to  profile_followings_url(current_user)
    end

  
end
