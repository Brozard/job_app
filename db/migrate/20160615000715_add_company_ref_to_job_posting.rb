class AddCompanyRefToJobPosting < ActiveRecord::Migration
  def change
    remove_column :job_postings, :company_id, :integer
    add_reference :job_postings, :buyer, index: true, foreign_key: true
    
    add_index :users, :email, unique: true
  end
end
