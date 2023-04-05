class EmployeesController < ApplicationController
    # CallBacks
    before_action :set_employee, only: [:show, :edit, :update, :destroy]
    before_action :check_login
    authorize_resource
  
  
    # the index action 
    def index 
        if current_user.admin_role?
            @active_employees = Employee.active.alphabetical.paginate(page: params[:active_page]).per_page(10)
            @inactive_employees = Employee.inactive.alphabetical.paginate(page: params[:active_page]).per_page(10)
        
        elsif current_user.manager_role?
            store = current_user.current_assignment.store
            @active_employees = Employee.active.alphabetical.select { |e| e.current_assignment.try(:store) == store }
            @inactive_employees = []
        end 
    end 

    # the show action
    def show 
        @current_assignment = @employee.current_assignment
        @other_assignments = @employee.assignments
    end 

    # the new action
    def new
        @employee = Employee.new
    end 

    # the edit action 
    def edit 
    end

    # the update action
    def update 
        if @employee.update(employee_params)
            flash[:notice] = "Updated " + @employee.proper_name + "'s information."
            redirect_to employee_path(@employee)
        else
            render :edit
        end
    end
 
    # the create action 
    def create 
        @employee = Employee.new(employee_params)
        if @employee.save
            flash[:notice] = "Successfully added " + @employee.proper_name + " as an employee."
            redirect_to employee_path(@employee)
        else 
            render :new
        end
    end 

    # the destory action
    def destroy
        if @employee.destroy
          redirect_to employees_path, notice: "Successfully removed employee."
        else
          @current_assignment = @employee.current_assignment
          render :show
        end
        
    end


    # Private Methods
    private 

    # set an employee
    def set_employee
        @employee = Employee.find(params[:id])
    end 

    # defining the employee params
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :ssn, :date_of_birth, :phone, :role, :username, :password, :password_confirmation)
    end
end