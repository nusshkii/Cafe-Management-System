class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]
  before_action :check_login
  authorize_resource  
  
  def time_out
    shifts = current_user.shifts.where('date < ?', Date.tomorrow)
    if shifts.empty?
      flash[:notice] = "You do not have any shifts today"
      redirect_to home_path
    else
      shifts = current_user.shifts.where(date: Date.current)
      shifts.each do |s|
        s.end_time = Time.current
        s.update(status: 'finished')
        s.save!
      end
      flash[:notice] = "Your shift has ended."
      redirect_to home_path
    end
  end 

  def time_in
    shifts = current_user.shifts.where(date: Date.current)
    if shifts.empty?
      flash[:notice] = "You do not have any shifts today"
      redirect_to home_path
    else
      shifts.each do |shift|
        shift.update(status: 'started')
        shift.start_time = Time.current
        shift.end_time = Time.current + 3.hours
        shift.save!
      end
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
    @employee = @shift.employee
    @store = @shift.store
    @shift_jobs = @shift.shift_jobs.alphabetical
  end

  def new
    @shift = Shift.new
  end

  def edit
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.assignment = Assignment.find_by(id: params[:shift][:assignment_id])
    @shift.employee = @shift.assignment.employee

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

  private
    def set_shift
      @shift = Shift.find(params[:id])
    end

    def shift_params
      params.require(:shift).permit(:date, :start_time, :end_time, :notes, :status, :assignment_id)
    end
end
