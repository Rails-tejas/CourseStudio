class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[show edit update destroy]

  def index
    @profile = current_user.profile
  end


  def show; end

  def new
    if current_user.profile
      redirect_to profile_path, alert: "You already have a profile."
    else
      @profile = Profile.new
    end
  end

  def create
    if current_user.profile
      redirect_to profile_path, alert: "You already have a profile."
    else
      @profile = current_user.build_profile(profile_params)
      if @profile.save
        redirect_to profile_path, notice: "Profile created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: "Profile updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @profile.destroy!
    redirect_to root_path, notice: "Profile deleted."
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:name, :gender, :bio, :avatar, :github_url, :linkedin_url, :favorite_languages, :domains)
  end
end
