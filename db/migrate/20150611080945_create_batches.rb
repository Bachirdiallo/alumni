class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.datetime :month
      t.datetime :year

      t.timestamps null: false
    end
  end
end
