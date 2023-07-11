class AlbumsController < ApplicationController
    before_action :album_params, only: [  :update, :create ]


    def new
        @album = current_user.albums.new
        render :new
    end

    def create
        @album= current_user.albums.new(album_params)
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

    private

    def album_params
        params.require(:album).permit(:title, :description, :mode, {list_image: []})
    end
end
