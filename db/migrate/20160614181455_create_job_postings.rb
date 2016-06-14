class CreateJobPostings < ActiveRecord::Migration
  def change
    create_table :job_postings do |t|
      t.string :job_title
      t.string :description
      t.integer :company_id
      t.date :posting_date
      t.boolean :is_filled

      t.timestamps null: false
    end
  end
end
