class RemoveIsGraduateFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :is_graduate, :boolean
  end
end
