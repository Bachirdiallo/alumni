class AddSkillsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :skills, :text
    add_column :jobs, :experience, :text
  end
end
