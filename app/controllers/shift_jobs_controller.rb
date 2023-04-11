class ShiftJobsController < ApplicationController
    def index
        raise ActionController::UrlGenerationError.new("No route matches #{params[:path]}")
    end

    def show
        raise ActionController::UrlGenerationError.new("No route matches #{params[:path]}")
      end

    def edit
        raise ActionController::UrlGenerationError.new("No route matches #{params[:path]}")
    end

    def update
        raise ActionController::UrlGenerationError.new("No route matches #{params[:path]}")
    end

    def new
      @shift = Shift.find(params[:shift_id])
      @shift_job = ShiftJob.new(shift: @shift)
    end

    def create
      @shift = Shift.find(params[:shift_job][:shift_id])
      @shift_job = @shift.shift_jobs.build(job_id: params[:shift_job][:job_id])
    
      if @shift_job.save
        redirect_to shift_path(@shift), notice: 'Shift job was successfully created.'
      else
        render :new
      end
    end           

    def destroy
      @shift_job = ShiftJob.find(params[:id])
      @shift = @shift_job.shift
      @shift_job.destroy
      redirect_to shift_path(@shift), notice: 'Shift job was successfully destroyed.'
    end

    private

    def shift_job_params
      params.require(:shift_job).permit(:job_id)
    end

end