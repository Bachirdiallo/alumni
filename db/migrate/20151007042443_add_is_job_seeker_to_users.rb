class AddIsJobSeekerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_job_seeker, :boolean, :default => false
  end
end
