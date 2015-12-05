class PaymentsController < ApplicationController
  expose(:student) { Student.find(params[:student_id])}

  before_action :authenticate_user!, only: [:full_index]

  def index
    @payments = Payment.where(student_id: student).order(:date)
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def new
      @payment = student.payments.new
  end

  def create
    @payment = student.payments.new(payment_params)
    if @payment.save
      redirect_to students_path, notice: I18n.t('shared.created', resource: 'Payment')
    else
      render :new
    end
  end

  def full_index
    @students = Student.all
    @january = payment_search(2015, 1)
    @february = payment_search(2015, 2)
    @march = payment_search(2015, 3)
    @april = payment_search(2015, 4)
    @may = payment_search(2015, 5)
    @june = payment_search(2015, 6)
    @july = payment_search(2015, 7)
    @august = payment_search(2015, 8)
    @september = payment_search(2015, 9)
    @october = payment_search(2015, 10)
    @november = payment_search(2015, 11)
    @december = payment_search(2015, 12)
    @months = [ @january, @february, @march, @april, @may, @june,
                @july, @august, @september, @october, @november, @december ]
  end

  private

  def payment_params
    params.require(:payment).permit(:date, :amount, :student_id)
  end

  def payment_search(year, month)
    Payment.where('extract(year from date) = ?', year).where('extract(month from date) = ?', month).to_a
  end
end
