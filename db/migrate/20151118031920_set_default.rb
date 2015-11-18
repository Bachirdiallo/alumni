class SetDefault < ActiveRecord::Migration
  def change
    change_column :users, :location_privacy_option, :string, :default => "Only Me"
    change_column :users, :contact_privacy_option, :string, :default => "Only Me"
    change_column :users, :social_privacy_option, :string, :default => "Only Me"
    change_column :users, :job_privacy_option, :string, :default => "Only Me"
  end
end
