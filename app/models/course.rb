class Course < ApplicationRecord
  
  belongs_to :user

  has_many :enrollments, dependent: :destroy

  has_many_attached :videos

  has_many :users, through: :enrollments

  has_many :user_video_progresses , dependent: :destroy

  validates :title, :description, presence: true

  validate :video_required, if: :new_record?

  private

  def video_required
    errors.add(:videos, "must be attached") unless videos.attached?
  end


end
