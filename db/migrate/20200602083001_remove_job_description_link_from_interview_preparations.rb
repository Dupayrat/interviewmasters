class RemoveJobDescriptionLinkFromInterviewPreparations < ActiveRecord::Migration[6.0]
  def change
    remove_column :interview_preparations, :job_description_link, :string
  end
end
