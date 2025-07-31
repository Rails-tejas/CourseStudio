class CertificatesController < ApplicationController
  before_action :authenticate_user!

  def show
    @course = Course.find(params[:course_id])
    progress_count = current_user.user_video_progresses.where(course: @course, completed: true).count

    if progress_count == @course.videos.count
      respond_to do |format|
        format.pdf do
         pdf = render_to_string pdf: "certificate",
                       template: "certificates/show",
                       layout: 'pdf',
                       locals: { course: @course }


          send_data(pdf, filename: "certificate.pdf", type: 'application/pdf')
        end
      end
    else
      redirect_to course_path(@course), alert: "You must complete all videos to get the certificate."
    end
  end
end
