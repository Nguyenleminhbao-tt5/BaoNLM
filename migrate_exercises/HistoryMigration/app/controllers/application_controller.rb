class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

   
    # {"controller"=>"devise/registrations", "action"=>"new"}
    # {"controller"=>"devise/sessions", "action"=>"new"}
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :user_type, :age, :fname, :lname])
        devise_parameter_sanitizer.permit(:account_update, keys: [:fname, :lname, :email])
    end
end
