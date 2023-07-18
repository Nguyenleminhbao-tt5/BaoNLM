class PhotosController < ApplicationController
    before_action :photo_params, only: [  :update, :create ]


    def new
        @photo = current_user.photos.new
        render :new
    end

    def create
        @photo= current_user.photos.new(photo_params)
        respond_to do |format|
            format.html do
                if @photo.save
                    flash[:success] = "New photo item successfully added!"
                    redirect_to profile_url(current_user)
                    
                else
                    flash.now[:error] = "Photo item creation failed"
                    render :new
                end
            end
        end
    end

    def edit 
        @photo = Photo.find(params[:id])
        render :edit
    end

    def update
        @photo = Photo.find(params[:id])
        respond_to do |format|
            format.html do
              if @photo.update(photo_params)
                # success message
                # redirect to index
                flash[:success] = "Photo item successfully updated!"
                redirect_to profile_url(current_user)
                
              else
                # error message
                # render edit
                flash.now[:error] = "Photo item update failed"
                render :edit
              end
            end
          end

    end

    def like
       
        
        @photo = Photo.find(params[:id])
        list_like = @photo.list_like

        is_like= params[:is_like]
        if is_like == "true" and !list_like.include?(current_user.id)
            list_like.push(current_user.id)  
        elsif is_like == "false" and list_like.include?(current_user.id)
            list_like.delete(current_user.id)
        end

        @photo.update(list_like: list_like)
        update_like_count(@photo, is_like)


    end

    def destroy
        @photo=Photo.find(params[:id])
        @photo.destroy
        flash[:success] = "The photo item was successfully destroyed."
        redirect_to  profile_url(current_user)
    end

    private

    def update_like_count(photo,is_like)
        

        if is_like == 'true'
            render turbo_stream:
                turbo_stream.replace("like_count_photo_#{photo.id}",
                    inline:  "
                    <%= turbo_frame_tag 'dislike_count_photo_#{photo.id}' do %>
                        <%= button_to like_photo_path(#{photo.id}, 'false'),class: 'cardImg__right-footer__btn border-0 bg-transparent' do %>
                            <i class='heart-icon like fa-solid fa-heart'></i>
                            <span>#{photo.list_like.size}</span>
                        <%end%>
                    <%end%>
                    
                    " )
        elsif is_like =='false'
            render turbo_stream:
                turbo_stream.replace("dislike_count_photo_#{photo.id}",
                    inline:  "
                    <%= turbo_frame_tag 'like_count_photo_#{photo.id}' do %>
                        <%= button_to like_photo_path(#{photo.id},'true'),class: 'cardImg__right-footer__btn border-0 bg-transparent' do %>
                            <i class='heart-icon dislike fa-solid fa-heart'></i>
                            <span>#{photo.list_like.size}</span>
                        <%end%>
                    <%end%>
                    " ) 
        end
    end

    def photo_params
        params.require(:photo).permit(:title, :description, :mode, :source, {list_like: []})
    end
end
