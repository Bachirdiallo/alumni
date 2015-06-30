class Campu < ActiveRecord::Base
  validates :name, presence: true, allow_blank: false
  has_many :faculties,  dependent: :destroy
  has_many :graduations, dependent: :destroy
end
