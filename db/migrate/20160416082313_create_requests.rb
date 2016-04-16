class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :email
      t.string :student_id
      t.string :programme
      t.string :faculty
      t.string :campus
      t.string :intake
      t.timestamps null: false
    end
  end
end
