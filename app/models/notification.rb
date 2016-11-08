class Notification < ApplicationRecord

  belongs_to :user

  validates :notice, presence: true
  validates :user, presence: true
  
end
