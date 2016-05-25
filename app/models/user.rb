class User < ActiveRecord::Base
  attr_accessor :is_current_city, :faculty, :programme, :batch, :campus
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :city
  after_validation :geocode

  has_many :graduations, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :messages, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  PRIVACY_OPTIONS = Array["Everyone", "Only Me", "My Batch", "My Programme"]

end
