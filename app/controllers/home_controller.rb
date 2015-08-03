class HomeController < ApplicationController
  def index
    @announcements = Announcement.all
    @events = Event.all
  end
end
