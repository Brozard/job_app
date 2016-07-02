class CreateJoinTableUserJobPosting < ActiveRecord::Migration
  def change
    create_join_table :users, :job_postings, table_name: :user_job_applications do |t|
      t.references :users, index: true, foreign_key: true
      t.references :job_postings, index: true, foreign_key: true
      t.boolean :is_rejected
    end
  end
end
