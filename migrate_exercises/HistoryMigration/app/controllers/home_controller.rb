class HomeController < ApplicationController

    def feed
        if user_signed_in?
            @list_photo=[]
            @list_album=[]
            list_id_following = current_user.follows_as_follower.pluck(:follower_id)
            
            list_id_following.each do |id|
                user = User.find id
                user.photos.order(created_at: :desc).each do |photo|
                    @list_photo.push([user,photo])
                end
                user.albums.order(created_at: :desc).each do |album|
                    @list_album.push([user,album])
                end
            end
        end
    end

    def discover
        if user_signed_in?
            @list_photo=[]
            @list_album=[]
            list_id_following = current_user.follows_as_follower.pluck(:follower_id)
            
            User.all.each do |user|
                if user != current_user
                    user.photos.order(created_at: :desc).each do |photo|
                        is_follow = list_id_following.include?(user.id) ? true : false 
                        @list_photo.push([user,photo,is_follow])
                    end
                    user.albums.order(created_at: :desc).each do |album|
                        is_follow = list_id_following.include?(user.id) ? true : false 
                        @list_album.push([user,album,is_follow])
                    end
                end
            end
        end
    end

end