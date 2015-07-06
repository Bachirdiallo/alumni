class User < ActiveRecord::Base

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

  def create_with_password(attr ={})
    generated_password = attr[:name] + "123"
    self.create(attr.merge(password: generated_password, password_confirmation: generated_password))
  end
end
