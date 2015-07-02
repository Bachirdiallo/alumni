class Batch < ActiveRecord::Base
  has_many :graduations, dependent: :destroy

  RIVACY_OPTIONS = Array["Everyone", "Only Me", "My Batch", "My Programme"]
  MONTHS = Array[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
end
