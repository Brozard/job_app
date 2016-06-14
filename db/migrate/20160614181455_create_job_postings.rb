class CreateJobPostings < ActiveRecord::Migration
  def change
    create_table :job_postings do |t|
      t.string :title
      t.string :description
      t.integer :company_id
      t.date :posting_date
      t.boolean :is_applied_for
      t.boolean :is_rejected

      t.timestamps null: false
    end
  end
end
