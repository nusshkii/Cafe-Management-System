class PayGradeRatesController < ApplicationController
    before_action :check_login
    authorize_resource
  
    def new
      @pay_grade_rate = PayGradeRate.new
      @pay_grade = PayGrade.find(params[:pay_grade_id])
    end
  
    # POST /pay_grades/:pay_grade_id/pay_grade_rates
    def create
        @pay_grade_rate = PayGradeRate.new(pay_grade_rate_params)
        puts "testing"
        
        if @pay_grade_rate.save
          redirect_to pay_grade_path(@pay_grade_rate), notice: 'Pay grade rate was successfully created.'
        else
          @pay_grade = PayGrade.find(params[:pay_grade_rate][:pay_grade_id])
          render :new, locals: {pay_grade: @pay_grade}

        end
    end
  
  
    private

    def pay_grade_rate_params
      params.require(:pay_grade_rate).permit(:pay_grade_id, :rate, :start_date, :end_date)
    end
  end
  