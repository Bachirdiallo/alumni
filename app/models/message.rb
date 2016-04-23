class Message < ActiveRecord::Base
  belongs_to :user
  validates :subject, :body, presence: true, allow_blank: false
end
