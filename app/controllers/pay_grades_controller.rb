class PayGradesController < ApplicationController
    before_action :set_pay_grade, only: [:show, :edit, :update]
    before_action :check_login
    authorize_resource
  
    def index
      @pay_grades = PayGrade.alphabetical
    end
  
    def show
      @pay_grade_rate_history = @pay_grade.pay_grade_rates
    end
  
    def new
      @pay_grade = PayGrade.new
    end
  
    def edit
    end
  
    def create
      @pay_grade = PayGrade.new(pay_grade_params)
      if @pay_grade.save
        redirect_to pay_grades_path, notice: 'Pay grade was successfully created.'
      else
        render :new
      end
    end
  
    def update
      if @pay_grade.update(pay_grade_params)
        redirect_to pay_grades_path, notice: 'Pay grade was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
        @pay_grade = PayGrade.find(params[:id])
        if @pay_grade.destroy
          flash[:notice] = "Pay grade successfully deleted."
        else
          flash[:error] = "Pay grade could not be deleted."
        end
        redirect_to pay_grades_path
    end  
  
    private
  
    def set_pay_grade
      @pay_grade = PayGrade.find(params[:id])
    end
  
    def pay_grade_params
      params.require(:pay_grade).permit(:level, :active)
    end
    
end
