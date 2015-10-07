class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column :users, :is_employer, :boolean, :default => false
  end
end
