class AddAluminKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :alumni_key, :string
  end
end
