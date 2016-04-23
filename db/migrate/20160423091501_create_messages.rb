class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

      t.string :subject
      t.text :body
      t.integer :receiver
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
