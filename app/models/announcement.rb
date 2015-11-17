class Announcement < ActiveRecord::Base
  include Bootsy::Container

  require 'carrierwave/orm/activerecord'
end
