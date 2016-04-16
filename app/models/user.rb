class User < ActiveRecord::Base
  attr_accessor :is_current_city, :faculty, :programme, :batch, :campus
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #validates :student_id, :name, presence: true, allow_blank: false
  #validates_uniqueness_of :student_id
  #validates :id_number, presence: true, allow_blank: true

  has_many :graduations, dependent: :destroy
  has_many :jobs, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  PRIVACY_OPTIONS = Array["Everyone", "Only Me", "My Batch", "My Programme"]

end
