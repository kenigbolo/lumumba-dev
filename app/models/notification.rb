class Notification < ApplicationRecord
  belongs_to :user
  validates :notice, presence: true
end
