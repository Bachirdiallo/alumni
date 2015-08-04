class HomeController < ApplicationController
  def index
    @announcements = Announcement.all
    @events = Event.all
    @carousels = Carousel.all
  end
end
