class Message < ApplicationRecord
	validates :name, :email, :message, presence: true
end
