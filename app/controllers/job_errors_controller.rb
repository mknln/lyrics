
class JobErrorsController < ApplicationController
  def index
    @job_errors = JobError.all
  end

  def show
  end

  def destroy
    @job_error = JobError.find(params[:id])
    @job_error.destroy

    respond_to do |format|
      format.html { redirect_to job_errors_url }
      format.json { head :no_content }
    end
  end
end
