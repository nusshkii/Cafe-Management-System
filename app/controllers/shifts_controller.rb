class ShiftsController < ApplicationController
    before_action :set_shift, only: [:show, :edit, :update, :destroy]
    before_action :check_login
    authorize_resource

    def time_out
      if current_user.shifts.first.date < Date.tomorrow
        flash[:notice] = "Your shift has ended."
        redirect_to home_path
      else
        flash[:notice] = "You do not have any shifts today"
        redirect_to home_path
      end
    end    

    def time_in
      shift = current_user.shifts.find_by(date: Date.current)
      if shift.nil?
        flash[:notice] = "You do not have any shifts today"
        redirect_to home_path
      else
        flash[:notice] = "Your shift has started."
        redirect_to home_path
      end
    end    

    def time_clock
      @shift_today = current_user.shifts.where(date: Date.today).first
      if @shift_today.nil?
        flash[:notice] = "You do not have any shifts today"
        redirect_to home_path
      else
        render :time_clock
      end
    end       
  
    def index
      @shifts = Shift.all
    end
  
    def show
    end
  
    def new
      @shift = Shift.new
    end
  
    def edit
    end
  
    def create
      @shift = Shift.new(shift_params)
  
      if @shift.save
        redirect_to @shift, notice: 'Shift was successfully created.'
      else
        render :new
      end
    end
  
    def update
      if @shift.update(shift_params)
        redirect_to @shift, notice: 'Shift was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @shift = Shift.find(params[:id])
      if @shift.destroy
        flash[:notice] = "Shift successfully deleted."
        redirect_to shifts_path
      else
        flash.now[:alert] = "Unable to delete shift."
        render :show
      end
    end

 

      def set_shift
        @shift = Shift.find(params[:id])
      end
  
      def shift_params
        params.require(:shift).permit(:date, :start_time, :end_time, :notes, :status, :assignment_id)
      end
  end