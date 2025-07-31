class ApplicationController < ActionController::Base

  protected

  def authenticate_user!
    unless user_signed_in?
      flash[:alert] = "You must be logged in to view this course."
      redirect_to new_user_session_path
    end
  end
  
end
