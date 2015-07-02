class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.integer :month
      t.integer :year

      t.timestamps null: false
    end
  end
end
