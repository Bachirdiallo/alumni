class Batch < ActiveRecord::Base
  has_many :graduations, dependent: :destroy
end
