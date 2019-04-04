module Users
  class RegistrationsController < Devise::RegistrationsController

    def new
      @user = User.new
      @user.build_user_information
    end

    def build_resource(params)
      super(resource_params)
    end

    protected

    def update_resource(resource, params)
      resource.update_attributes(params)
    end

    def account_update_params
      params = devise_parameter_sanitizer.sanitize(:account_update)

      if passwords_blank?(params)
        params.except(:password, :password_confirmation)
      else
        params
      end
    end

    def resource_params
      params.require(:user).permit(:email, :full_name, :password, :password_confirmation, user_information_attributes: [ :dob, :address, :phone_number ] )
    end

    def passwords_blank?(params)
      params[:password].blank? && params[:password_confirmation].blank?
    end
  end
end
