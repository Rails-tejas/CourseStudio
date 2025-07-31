class Profile < ApplicationRecord

  belongs_to :user, dependent: :destroy

  has_one_attached :avatar
 
  validates :github_url, format: URI::regexp(["http", "https"]), allow_blank: true
  
  validates :linkedin_url, format: URI::regexp(["http", "https"]), allow_blank: true
  
  validates :user_id, uniqueness: true 
  
  
end
