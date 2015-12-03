class PaymentsController < ApplicationController
  expose(:student) { Student.find(params[:student_id])}
  def index
    @payments = Payment.where(student_id: student).order(:date)
  end

  def show
    @payment = Payment.where(id: params[:id])
  end

  def new
  end

  def create
    @payment = student.payments.new(payment_params)
    if @payment.save
      redirect_to students_path, notice: I18n.t('shared.created', resource: 'Payment')
    else
      redirect_to students_path
    end
  end

  def full_index
    @students = Student.all
  end

  private

  def payment_params
    params.require(:payment).permit(:date, :amount, :student_id)
  end
end
