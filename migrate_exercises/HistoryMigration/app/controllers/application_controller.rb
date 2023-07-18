class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    layout :set_layout





    protected

    def set_layout
        if current_user&.user_type == 'admin'
            'admin'
        else
            'application'
        end
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :user_type, :age, :fname, :lname])
        devise_parameter_sanitizer.permit(:account_update, keys: [:fname, :lname, :email, :avatar])
    end
end
