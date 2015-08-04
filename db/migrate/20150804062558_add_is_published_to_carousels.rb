class AddIsPublishedToCarousels < ActiveRecord::Migration
  def change
    add_column :carousels, :is_published, :boolean
  end
end
