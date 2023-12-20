class DebtorsController < ApplicationController
  before_action :set_trip

  def index
    @user_debts = current_user.debtors
  end

  def show
    @debtor = Debtor.find(params[:id])
  end

  def update
    @debt = Debtor.find(params[:id])

    new_amount_owed = @debt.amount_owed - debtor_params[:amount_owed].to_f

    if @debt.update(amount_owed: new_amount_owed)
      redirect_to trip_debtors_path(@trip)
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def debtor_params
    params.require(:debtor).permit(:amount_owed)
  end
end
