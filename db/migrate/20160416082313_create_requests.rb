class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :student_id
      t.string :programme
      t.string :faculty
      t.string :campus
      t.string :intake
    end
  end
end
