class ExpensesController < ApplicationController
  before_action :set_trip
  before_action :set_categories
  before_action :set_debtors

  def new
    @expense = @trip.expenses.new
  end

  def index
    @expense = @trip.expenses.new
    @all_expenses = @trip.expenses
  end

  def create
    @expense = @trip.expenses.new(expense_params)
    @expense.payer_id = current_user.id
    if @expense.save
      redirect_to trip_expenses_path(@trip), notice: 'Expense was successfully created.'
    else
      render :new, status: :unprocessable_entity
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

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_debtors
    @debtors = Debtor.all.map { |user| [user.display_name, user.id] }
  end

  def set_categories
    @categories = ExpenseCategory.all.map { |c| [c.name, c.id] }
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :description, :date)
  end
end
