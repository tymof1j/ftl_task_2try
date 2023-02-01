# frozen_string_literal: true

class SharedListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @shared_lists = SharedList.where(viewer_id: current_user.id)
    @shared_lists_by_me = SharedList.where(owner_id: current_user.id)
    @spendings = Spending.where(user_id: @shared_lists.pluck(:owner_id))
  end

  def new
    @shared_list = SharedList.new(owner_id: current_user.id)
  end

  def create
    @shared_list = SharedList.new(shared_list_params.merge(owner_id: current_user.id))
    if @shared_list.save
      redirect_to @shared_list, notice: 'Spending list was successfully shared.'
    else
      render :new
    end
  end

  def show
    @shared_list = SharedList.find(params[:id])
    @spendings = Spending.where(user_id: @shared_list.owner_id)
  end

  private

  def shared_list_params
    params.require(:shared_list).permit(:viewer_id)
  end
end
