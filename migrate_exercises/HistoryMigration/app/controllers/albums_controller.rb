class AlbumsController < ApplicationController
    before_action :album_params, only: [  :update, :create ]


    def new
        @album = current_user.albums.new
        render :new
    end

    def create
        @album= current_user.albums.new(album_params)
        #render :json => params
        respond_to do |format|
            format.html do
                if @album.save
                    flash[:success] = "New album item successfully added!"
                    redirect_to profile_url(current_user)
                    
                else
                    flash.now[:error] = "Album item creation failed"
                    render :new
                end
            end
        end
    end

    def edit 
        @album = Album.find(params[:id])
        render :edit
    end

    def update
        @album = Album.find(params[:id])
        # render :json => params
        respond_to do |format|
            format.html do
              if @album.update(album_params)
                # success message
                # redirect to index
                flash[:success] = "album item successfully updated!"
                redirect_to profile_url(current_user)
                
              else
                # error message
                # render edit
                flash.now[:error] = "album item update failed"
                render :edit
              end
            end
        end

    end

    def destroy
        @album=Album.find(params[:id])
        @album.destroy
        flash[:success] = "The album item was successfully destroyed."
        redirect_to  profile_url(current_user)
    end

    def like

        @album = Album.find(params[:id])
        list_like = @album.list_like


        is_like= params[:is_like]
        if is_like == "true" and !list_like.include?(current_user.id)
            list_like.push(current_user.id)  
        elsif is_like == "false" and list_like.include?(current_user.id)
            list_like.delete(current_user.id)
        end

        @album.update(list_like: list_like)
        update_like_count(@album, is_like)

    end


    private

    def update_like_count(album,is_like)
        

        if is_like == 'true'
            render turbo_stream:
                turbo_stream.replace("like_count_album_#{album.id}",
                    inline:  "
                    <%= turbo_frame_tag 'dislike_count_album_#{album.id}' do %>
                        <%= button_to like_album_path(#{album.id}, 'false'),class: 'cardImg__right-footer__btn border-0 bg-transparent' do %>
                            <i class='heart-icon like fa-solid fa-heart'></i>
                            <span>#{album.list_like.size}</span>
                        <%end%>
                    <%end%>
                    
                    " )
        elsif is_like =='false'
            render turbo_stream:
                turbo_stream.replace("dislike_count_album_#{album.id}",
                    inline:  "
                    <%= turbo_frame_tag 'like_count_album_#{album.id}' do %>
                        <%= button_to like_album_path(#{album.id},'true'),class: 'cardImg__right-footer__btn border-0 bg-transparent' do %>
                            <i class='heart-icon dislike fa-solid fa-heart'></i>
                            <span>#{album.list_like.size}</span>
                        <%end%>
                    <%end%>
                    " ) 
        end
    end


    def album_params
        params.require(:album).permit(:title, :description, :mode, {list_image: []}, {list_like: []})
    end
end
