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
      #@shift = Shift.find(params[:shift_id])
      #@shift_job = ShiftJob.new(shift: @shift)
      @shift_job = ShiftJob.new(shift_id: params[:shift_id])
    end

    def create
      @shift_job = ShiftJob.new(shift_job_params)

      if @shift_job.save
        redirect_to shift_path(@shift_job.shift_id), notice: 'Job was successfully added to the shift.'
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
      params.require(:shift_job).permit(:shift_id, :job_id)
    end

end