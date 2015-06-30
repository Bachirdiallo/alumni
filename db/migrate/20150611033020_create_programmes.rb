class CreateProgrammes < ActiveRecord::Migration
  def change
    create_table :programmes do |t|
      t.string :name
      t.belongs_to :faculty, index: true
      t.timestamps null: false
    end
  end
end
