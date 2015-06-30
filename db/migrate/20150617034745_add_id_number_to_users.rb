class AddIdNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :id_number, :string
    add_index :users, :id_number, unique: true
  end
end
