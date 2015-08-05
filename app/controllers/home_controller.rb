class HomeController < ApplicationController
  def index
    @announcements = Announcement.all
    @events = Event.all
    @carousels = Carousel.where(:is_published => true)
  end
end
