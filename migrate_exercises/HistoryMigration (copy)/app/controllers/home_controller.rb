class HomeController < ApplicationController

    def index
        @users = User.all
    end

    def album
    
    end

end