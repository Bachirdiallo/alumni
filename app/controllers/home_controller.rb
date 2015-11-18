class HomeController < ApplicationController
  def index
    @announcements = Announcement.order("created_at desc").limit(3)
    @events = Event.order("created_at desc").limit(3)
    @carousels = Carousel.where(:is_published => true)
  end
end
