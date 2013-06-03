class QueueJobsController < ApplicationController
  # GET /queue_jobs
  # GET /queue_jobs.json
  def index
    @queue_jobs = QueueJob.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @queue_jobs }
    end
  end

  # GET /queue_jobs/1
  # GET /queue_jobs/1.json
  def show
    @queue_job = QueueJob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @queue_job }
    end
  end

  # GET /queue_jobs/new
  # GET /queue_jobs/new.json
  def new
    @queue_job = QueueJob.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @queue_job }
    end
  end

  # POST /queue_jobs
  # POST /queue_jobs.json
  def create
    @queue_job = QueueJob.new(params[:queue_job])

    respond_to do |format|
      if @queue_job.save
        @queue_job.scrape_album
        format.html { redirect_to @queue_job, notice: 'Queue job was successfully created.' }
        format.json { render json: @queue_job, status: :created, location: @queue_job }
      else
        format.html { render action: "new" }
        format.json { render json: @queue_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /queue_jobs/1
  # DELETE /queue_jobs/1.json
  def destroy
    @queue_job = QueueJob.find(params[:id])
    @queue_job.destroy

    respond_to do |format|
      format.html { redirect_to queue_jobs_url }
      format.json { head :no_content }
    end
  end
end
