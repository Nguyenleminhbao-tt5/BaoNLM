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

    def destroy
        @photo=Photo.find(params[:id])
        @photo.destroy
        flash[:success] = "The photo item was successfully destroyed."
        redirect_to  profile_url(current_user)
    end

    private

    def photo_params
        params.require(:photo).permit(:title, :description, :mode, :source)
    end
end
