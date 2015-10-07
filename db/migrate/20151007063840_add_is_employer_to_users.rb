class AddIsEmployerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_employer, :boolean, :default => true
  end
end
