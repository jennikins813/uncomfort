class ProfilesController < ApplicationController
  before_filter :require_login
  before_filter :get_user

  def index
  end

  def show
    @profile = Profile.find(params[:id])
    if current_user
      render :show
    else
    end
  end

  def new
    @user = User.find(params[:user_id])
    @profile = @user.profile.build
  end

  def create
    @profile = @user.profiles.build(profile_params)
    @profile.user_id = current_user.id

    if @profile.save
      redirect_to user_profile_path, :notice => "Profile Created!"
    else
    end
  end

  def edit
    @profile=Profile.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])

    if @user.profile(params[:id]).update(profile_params)
      redirect_to user_profile_path, :notice => "Profile updated!"
    else
    end
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:user_id, :name, :photo, :bio, :website, :remove_photo)
  end

  def get_user
    current_user
  end
end
