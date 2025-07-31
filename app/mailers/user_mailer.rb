class UserMailer < ApplicationMailer

  default from: 'support@coursestudio.com'

  def welcome_email(user)
    @user = user
    @url  = new_user_session_url
    mail(to: @user.email, subject: 'Welcome to CourseStudio!')
  end

  # def new_course_notification(user, course)
  #   @user = user
  #   @course = course
  #   mail(to: @user.email, subject: "🎓 New Course Available: #{@course.title}")
  # end
  
end
