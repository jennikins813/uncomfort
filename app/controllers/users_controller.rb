class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create]

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      auto_login(@user)
      redirect_to users_url, :notice => "Signed Up!"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 
  def user_params
    params.require(:user).permit(:name, :image, :bio, :email, :password, :password_confirmation)
  end

  def not_authenticated
    redirect_to login_path, alert: "Please Login First"
  end
end
