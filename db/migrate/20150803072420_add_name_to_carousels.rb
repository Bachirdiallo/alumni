class AddNameToCarousels < ActiveRecord::Migration
  def change
    add_column :carousels, :name, :string
  end
end
