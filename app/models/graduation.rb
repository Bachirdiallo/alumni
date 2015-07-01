class Graduation < ActiveRecord::Base
  belongs_to :user
  belongs_to :batch
  belongs_to :programme
  belongs_to :faculty
  belongs_to :campu
end
