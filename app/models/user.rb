class User < ApplicationRecord
  # Relationships with other models
  has_many :designs
  has_many :articles
  has_many :addresses
  has_many :orders
  # Use friendly_id to generate user friendly urls
  extend FriendlyId
  friendly_id :first_name, use: [:slugged, :finders, :history]
  # Voting
  acts_as_voter
  # Add image uploader view
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  MALE = 'Male'
  FEMALE = 'Female'
  OTHER_GENDER = 'Gender Free'
  GENDERS = [MALE, FEMALE, OTHER_GENDER]

  validates :gender, inclusion: GENDERS, allow_blank: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.image = auth.info.image
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.location = auth.info.location
      user.description = auth.info.about
      user.gender = auth.extra.raw_info.gender.capitalize
      user.save!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def is_admin?
    admin == true
  end

  def after_confirmation
    WelcomeMailer.signup_confirmation(self).deliver
  end

  def to_s
    "#{first_name} #{last_name}"
  end

end
