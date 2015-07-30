class HomeController < ApplicationController
  def index
    @announcements = Announcement.all
    @events = Event.all
  end

  def announcement
    puts'sdfsfdsf', params[:id]
    @a = Announcement.where(id: params[:id])
    puts'@a', @a

  end

  def home_params
    params.permit(:title, :content)
  end
end
