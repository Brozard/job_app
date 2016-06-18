class AddUrlToJobPosting < ActiveRecord::Migration
  def change
    add_column :job_postings, :posting_url, :string
  end
end
