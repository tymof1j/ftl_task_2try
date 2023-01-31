# frozen_string_literal: true

class SpendingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_spending, only: %i[show edit update destroy]

  def index
    @spendings = current_user.spendings
  end

  def show; end

  def new
    @spending = current_user.spendings.new
  end

  def edit; end

  def create
    @spending = current_user.spendings.new(spending_params)

    if @spending.save
      redirect_to @spending, notice: 'Spending was successfully created.'
    else
      render :new
    end
  end

  def update
    if @spending.update(spending_params)
      redirect_to @spending, notice: 'Spending was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @spending.destroy
    redirect_to spendings_url, notice: 'Spending was successfully destroyed.'
  end

  private

  def set_spending
    @spending = current_user.spendings.find(params[:id])
  end

  def spending_params
    params.require(:spending).permit(:name, :amount, :category, :description, :user_id)
  end
end
