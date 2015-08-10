class RemoveContentPrivacyOptionFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :content_privacy_option, :string
  end
end
