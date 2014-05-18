class UsersController < ApplicationController
  #skip_before_filter :require_login, only: [:new, :create, :edit, :update]

  def index
  end

  def show
    @user = User.find(params[:id])

    if current_user
      @profile = @user.profile
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      auto_login(@user)
      redirect_to root_path, :notice => "Signed Up!" 
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if current_user.update_attributes(user_params)
      redirect_to user_path(@user), :notice => "User Info Updated!"
    else
      render :edit
    end
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
