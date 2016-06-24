class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show, :edit, :update, :destroy]

  # GET /job_postings
  # GET /job_postings.json
  def index
    @job_postings = JobPosting.all
  end

  # GET /job_postings/1
  # GET /job_postings/1.json
  def show
  end

  # GET /job_postings/new
  def new
    @job_posting = JobPosting.new
  end

  # GET /job_postings/1/edit
  def edit
  end

  # POST /job_postings
  # POST /job_postings.json
  def create
    @job_posting = JobPosting.new(job_posting_params)
    set_company
    respond_to do |format|
      if @job_posting.save
        format.html { redirect_to @job_posting, notice: 'Job posting was successfully created.' }
        format.json { render :show, status: :created, location: @job_posting }
      else
        format.html { render :new }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_postings/1
  # PATCH/PUT /job_postings/1.json
  def update
    set_company
    respond_to do |format|
      if @job_posting.update(job_posting_params)
        format.html { redirect_to @job_posting, notice: 'Job posting was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_posting }
      else
        format.html { render :edit }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_postings/1
  # DELETE /job_postings/1.json
  def destroy
    @job_posting.destroy
    respond_to do |format|
      format.html { redirect_to job_postings_url, notice: 'Job posting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_posting
      @job_posting = JobPosting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_posting_params
      params.require(:job_posting).permit(:job_title, :description, :company_id, :posting_date, :is_filled, :company_attributes => [:company_name, :location, :industry])
    end

    def set_company
      # Do not run the following code if the current Job Posting record already has a Company ID and it's unchanged from what's in the params.
      # If these are both true, there is already an associated Company value, and it does not need to be changed.
      # If these are not both true, it either means we do not have a Company value and we mean to associate one, or we are changing or removing the associated Company.
      unless @job_posting.company_id && @job_posting.company.company_name == params["job_posting"]["company"]["company_name"]
        # Do not run the following code if there is no Company Name params value.
        # If this is true, then that means we have an associated Company value that we wish to remove.
        # If this is not true, then we as associating either a new or existing Company value to this Job Posting.
        if !params["job_posting"]["company"]["company_name"]
          # Remove the Company associated with this Job Posting
          @job_posting.company_id = nil
        else
          # Associate the Company with the Job Posting
          @job_posting.company_id = find_company
        end
      end
    end

    def find_company
      # We are searching for an existing Company whose name matches the params value, if there is one.
      @job_posting_company ||= Company.find_by(company_name: params["job_posting"]["company"]["company_name"])
      # If we did not find an existing Company record matching that name...
      if !@job_posting_company
        # ...we will create one using the entered params.
        @job_posting_company = Company.create(
                                          company_name: params["job_posting"]["company"]["company_name"],
                                          location: params["job_posting"]["company"]["location"],
                                          industry: params["job_posting"]["company"]["industry"]
                                          )
        # @job_posting_company = Company.new(params["job_posting"]["company"])
        # @job_posting_company.save
      end
      # Return the Company record
      @job_posting_company.id
    end
end
