class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end
    
  def edit
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update(user_params)
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end

  def show
  	@user = User.find(params[:id])
  end

  def destroy
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation)
  end
end