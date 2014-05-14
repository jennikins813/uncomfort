class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create]

  def index
    #@user = User.all 
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
      redirect_to user_path, :notice => "Signed Up!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    #if current_user != user.id
    #  alert: "You can't do that!"
    #end
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
