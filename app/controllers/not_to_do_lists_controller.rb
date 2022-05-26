class NotToDoListsController < ApplicationController
  def new
    @not_to_do_list = NotToDoList.new
  end

  def create
    @not_to_do_list = current_user.not_to_do_lists.new(list_params)
    if @not_to_do_list.save
      redirect_to not_to_do_lists_path
    else
      render :new
    end
  end

  def index
    @not_to_do_lists = current_user.not_to_do_lists.all
  end

  def edit
    @not_to_do_list = current_user.not_to_do_lists.find(params[:id])
  end

  def update
    @not_to_do_list = current_user.not_to_do_lists.find(params[:id])
    if @not_to_do_list.update
      redirect_to not_to_do_lists_path
    else
      render :edit
    end
  end

  def destroy
    @not_to_do_list = current_user.not_to_do_lists.find(params[:id])
    @not_to_do_list.destroy
    redirect_to not_to_do_lists_path
  end

  private

  def list_params
    params.require(:not_to_do_list).permit(:work, :life, :relationships)
  end
end
