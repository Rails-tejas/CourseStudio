class User < ApplicationRecord

  has_one :profile, dependent: :destroy

  has_many :courses, dependent: :destroy
 
  has_many :enrollments

  has_many :courses, through: :enrollments

  after_create :build_default_profile,  :send_welcome_email

  has_many :user_video_progresses , dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_destroy :prevent_admin_self_deletion
  
  def send_welcome_email
    UserMailer.welcome_email(self).deliver_later
  end
  
  private


  def build_default_profile
    build_profile.save
  end


  def prevent_admin_self_deletion
    if self.admin? && Current.user == self
      errors.add(:base, "Admins cannot delete their own account.")
      throw :abort
    end
  end


end
