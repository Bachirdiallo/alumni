class AddlocationPrivacyOptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location_privacy_option, :string
    add_column :users, :content_privacy_option, :string
    add_column :users, :job_privacy_option, :string
    add_column :users, :social_privacy_option, :string
  end
end
