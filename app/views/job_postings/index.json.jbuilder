json.array!(@job_postings) do |job_posting|
  json.extract! job_posting, :id, :title, :description, :company_id, :posting_date, :is_applied_for, :is_rejected
  json.url job_posting_url(job_posting, format: :json)
end
