class ExpensesController < ApplicationController
  before_action :set_trip
  before_action :set_categories
  before_action :set_debtors

  def new
    @expense = @trip.expenses.new
    @expnese.build_debtor
  end

  def index
    @all_expenses = @trip.expenses.reject(&:new_record?)
  end

  def create
    @expense = @trip.expenses.build(expense_params)
    @expense.payer_id = current_user.id
    user_ids = params[:expense][:user_ids].reject(&:blank?)

    if @expense.save
      create_expense_debts(@expense, user_ids)
      redirect_to trip_expenses_path(@trip), notice: 'Expense was successfully created.'
    else
      render :index, status: :unprocessable_entity
    end
  end

  def update
    @expense = Expense.find(params[:id])

    if @expense.update(expense_params)
      redirect_to trip_expenses_path(@trip), notice: 'Expense was updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to trip_expenses_path(@trip)
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_categories
    @categories = ExpenseCategory.all.map { |c| [c.name, c.id] }
  end

  def expense_params
    params.require(:expense).permit(:expense_category_id, :name, :amount, :description, :date,
                                    debtors_attributes: [:user_id])
  end

  # debtor methods
  def set_debtors
    @debtors = UserTrip.where(trip_id: @trip.id)
                       .reject { |user_trip| user_trip.user_id == current_user.id }
                       .map { |user_trip| [user_trip.user.display_name, user_trip.user.id] }
  end

  def create_expense_debts(expense, user_ids)
    user_ids.each do |id|
      amount_owed = calc_amount_owed(expense.amount, user_ids.size + 1)
      Debtor.create!(expense_id: expense.id, user_id: id, amount_owed:)
    end
  end

  def calc_amount_owed(total_amount, number_of_debtors)
    total_amount / number_of_debtors
  end
end
