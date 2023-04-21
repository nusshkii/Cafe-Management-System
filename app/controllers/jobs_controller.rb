class JobsController < ApplicationController
    # A callback to set up an @owner object to work with 
    before_action :set_job, only: [:show, :edit, :update, :destroy]
    before_action :check_login
    authorize_resource

    def index
      @jobs = Job.active.alphabetical.paginate(page: params[:active_page]).per_page(10) 
    end

    def new
      @job = Job.new
    end

    def edit
    end

    def create
      @job = Job.new(job_params)
      if @job.save
        redirect_to jobs_path(@jobs) 
      else
        render action: 'new'
      end
    end

    def update
      if @job.update(job_params)
        flash[:notice] = "Updated job information."
        redirect_to jobs_path(@jobs)
      else
        render :edit
      end
    end

    def destroy
        if @job.destroy
          redirect_to jobs_path, notice: "Successfully removed job."
        else
          render :index
        end

    end

    private 

    def set_job
        @job = Job.find(params[:id])
    end 

    # defining the employee params
    def job_params
        params.require(:job).permit(:name, :description, :active)
    end

end