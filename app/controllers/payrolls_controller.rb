class PayrollsController < ApplicationController
  before_action :check_login
  #authorize_resource

  def employee_payroll
    authorize! :employee_payroll, :payrolls_controller
    @employee = Employee.find(params['employee_id'])
    start_date = Date.parse(params['start_date'])
    end_date = Date.parse(params['end_date'])
    @date_range = DateRange.new(start_date, end_date)
    calculator = PayrollCalculator.new(@date_range)
    @employee_payroll = calculator.create_payroll_record_for(@employee)
  end  

  def store_payroll
    if params[:store_id]
    @store = Store.find(params[:store_id])
    authorize! :store_payroll, :payrolls_controller, for: @store
    else
    @store = current_user.current_assignment.store
    end
    start_date = Date.parse(params['start_date'])
    end_date = Date.parse(params['end_date'])
    @date_range = DateRange.new(start_date, end_date)
    calculator = PayrollCalculator.new(@date_range)
    @store_payroll = calculator.create_payrolls_for(@store)
  end 

  def employee_form
    authorize! :employee_form, :payrolls_controller
    if current_user.role == 'admin'
      @employee = Employee.new
      render :employee_form
    else
      redirect_to home_path
    end
  end

  def store_form
  end
  
end