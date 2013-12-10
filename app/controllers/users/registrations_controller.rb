class Users::RegistrationsController < Devise::RegistrationsController

  def update
    @user = User.find(current_user.id)

    if user_params["password"].blank?
      if @user.update_without_password( user_params )
        set_flash_message :notice, :updated
        redirect_to after_update_path_for(@user)
      else
        render "devise/registrations/edit"
      end
    else
      if @user.update_attributes(user_params)
        set_flash_message :notice, :updated
        # Sign in the user bypassing validation in case his password changed
        sign_in @user, bypass: true
        redirect_to after_update_path_for(@user)
      else
        render "devise/registrations/edit"
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, 
                                 :email, 
                                 :password, 
                                 :password_confirmation, 
                                 :avatar, 
                                 :avatar_cache)
  end
end
