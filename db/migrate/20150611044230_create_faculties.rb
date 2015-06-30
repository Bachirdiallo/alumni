class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :name
      t.belongs_to :campu, index: true

      t.timestamps null: false
    end
  end
end
