class VideoProgressController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def create
    respond_to do |format|
      format.json do
        video_id = params[:video_id]
        course_id = params[:course_id]

        progress = UserVideoProgress.find_or_initialize_by(
          user: current_user, 
          course_id: course_id,
          video_id: video_id
        )
        progress.completed = true
        if progress.save
          render json: { message: "Progress saved" }, status: :ok
        else
          render json: { error: "Failed to save progress" }, status: :unprocessable_entity
        end
      end
    end
  end
end
