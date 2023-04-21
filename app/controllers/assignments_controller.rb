class AssignmentsController < ApplicationController
    before_action :set_assignment, only: [:show, :edit, :update, :destroy]
    before_action :check_login
    authorize_resource
  
    def index
      if current_user.admin_role?
        @current_assignments = Assignment.current.chronological.paginate(page: params[:page]).per_page(10)
        @past_assignments = Assignment.past.chronological.paginate(page: params[:page]).per_page(10)

      else
        @current_assignments = current_user.assignments.current
        @past_assignments = current_user.assignments.past
      end
    end
  
    def show

    end
  
    def new
      @assignment = Assignment.new
    end
  
    def edit

    end
  
    def create
      @assignment = Assignment.new(assignment_params)
      if @assignment.save
        flash[:notice] = "Successfully added the assignment."
        redirect_to assignments_path
      else
        render action: 'new'
      end
    end
  
    def update
      if @assignment.update(assignment_params)
        flash[:notice] = "Updated assignment information."
        redirect_to assignments_path
      else
        render action: 'edit'
      end
    end
  
    def destroy
      if @assignment.destroy
        flash[:notice] = "Removed assignment from the system."
        redirect_to assignments_path
      else
        @store=@assignment.store
        @employee= @assignment.employee
        render action: 'show'
      end
    end
  
    private
  
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end
  
    def assignment_params
      params.require(:assignment).permit(:store_id, :employee_id, :start_date, :end_date, :pay_grade_id)
    end

end