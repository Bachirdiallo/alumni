class AddIsGraduateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_graduate, :boolean, :default => true
  end
end
