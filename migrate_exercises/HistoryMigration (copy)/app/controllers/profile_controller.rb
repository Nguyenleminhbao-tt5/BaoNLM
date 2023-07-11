class ProfileController < ApplicationController
    before_action :authenticate_user!




    def tab_photos
        @infors = infor_size
        user = User.find(params[:id])
        @list_photo = user.photos
    end

    def tab_albums
        @infors = infor_size
        user = User.find(params[:id])
   
    end

    def tab_followings
        @infors = infor_size
        user = User.find(params[:id])

        list_id_follower = user.follows_as_following.pluck(:following_id) # list id  nhung nguoi dang follow minh
        list_id_following = user.follows_as_follower.pluck(:follower_id)  # list id minh dang follow nguoi ta
        @list_follower = handle_card_user(list_id_following,list_id_follower)
   
    end

    def tab_followers
        @infors = infor_size
        user = User.find(params[:id])
        
        list_id_follower = user.follows_as_following.pluck(:following_id) # list id  nhung nguoi dang follow minh
        list_id_following = user.follows_as_follower.pluck(:follower_id)  # list id minh dang follow nguoi ta
        @list_follower = handle_card_user(list_id_follower,list_id_following)
      
    end

    private

    def infor_size
        user = User.find(params[:id])
        return [user, user.photos.size, user.albums.size, 
            user.follows_as_follower.size, user.follows_as_following.size]
    end

    def handle_card_user(arr1, arr2)  
        result=[]
        arr1.each do |ele|
            user = User.find_by id: ele
            name = user.fullname
            avatar = '' # after fixing
            count_photo = user.photos.size
            count_album = user.albums.size

            if arr2.include?(ele)
                is_follow= true
            else 
                is_follow = false
            end

            result.push CardUser.new(user, name, avatar, count_photo,count_album, is_follow)
        end
        return result
    end

 

end



class CardUser
    attr_accessor :obj, :name, :avatar, :count_photo, :count_album, :is_follow
    def initialize (obj, name, avatar, count_photo, count_album, is_follow)
        @obj = obj
        @name = name
        @avatar = avatar
        @count_photo = count_photo
        @count_album = count_album
        @is_follow = is_follow
    end
end


# @list_id_follower.each do |ele|
#     @user = User.find_by id: ele
#     name = @user.fullname
#     avatar = '' # after fixing
#     count_photo = @user.photos.size
#     count_album = @user.albums.size

#     if @list_id_following.include?(ele)
#         is_follow= true
#     else 
#         is_follow = false
#     end

#     @list_follower.push CardUser.new(name, avatar, count_photo,count_album, is_follow)
# end