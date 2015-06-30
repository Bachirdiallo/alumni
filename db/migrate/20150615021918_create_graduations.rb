class CreateGraduations < ActiveRecord::Migration
  def change
    create_table :graduations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :batch, index: true
      t.belongs_to :programme, index: true
      t.belongs_to :campu, index: true
      t.belongs_to :faculty, index: true
      t.timestamps null: false
    end
  end
end
