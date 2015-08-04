class AddCarouselToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :carousel, :string
  end
end
