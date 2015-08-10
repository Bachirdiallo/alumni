class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.boolean :current
      t.datetime :from
      t.datetime :to
      t.string :city
      t.string :country
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
