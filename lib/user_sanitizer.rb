class User::ParameterSanitizer < Devise::ParameterSanitizer
    private
    
    def sign_in
        default_params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :username)
    end
    
    def sign_up
        default_params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :username)
    end
end