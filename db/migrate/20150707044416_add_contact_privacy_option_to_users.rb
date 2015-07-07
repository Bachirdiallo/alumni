class AddContactPrivacyOptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :contact_privacy_option, :string
  end
end
