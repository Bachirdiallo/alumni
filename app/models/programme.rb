class Programme < ActiveRecord::Base
  validates :name, presence: true, allow_blank: false

  has_many :graduations, dependent: :destroy
  belongs_to :faculty
end
