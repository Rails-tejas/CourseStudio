# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |user|
      if user.persisted?
        user.create_profile unless user.profile
      end
    end
  end

  protected

  # Redirect after successful sign-up
  def after_sign_up_path_for(resource)
    profile_path  
  end
end
