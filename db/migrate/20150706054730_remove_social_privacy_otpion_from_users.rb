class RemoveSocialPrivacyOtpionFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :location_privacy_otpion, :string
    remove_column :users, :content_privacy_otpion, :string
    remove_column :users, :social_privacy_otpion, :string
    remove_column :users, :job_privacy_otpion, :string
  end
end
