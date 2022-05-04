class DreamListsController < ApplicationController
  require 'date'
  def new
    @dream_list = DreamList.new
  end

  def create
    @dream_list = current_user.dream_lists.new(dream_list_params)
    if @dream_list.save
        @dream_list.update(period: period_get)
      redirect_to dream_lists_path
      flash[:notice] = "１つ夢が追加されました。"
    else
      render :new
    end
  end

  def index
    @dream_lists = current_user.dream_lists.page(params[:page])
  end

  def show
    @dream_list = current_user.dream_lists.find(params[:id])
  end

  def edit
    @dream_list = current_user.dream_lists.find(params[:id])
  end

  def update
    @dream_list = current_user.dream_lists.find(params[:id])
    if @dream_list.update(dream_list_params)
      redirect_to dream_list_path(@dream_list.id)
      flash[:notice] = "更新に成功しました。"
    else
      render :edit
    end
  end

  def destroy
    @dream_list = current_user.dream_lists.find(params[:id])
    @dream_list.destroy
    redirect_to dream_lists_path
    flash[:notice] = "１つ夢を削除しました。"
  end

  def search_dream_list
    @dream_list = DreamList.new
    @dream_lists = DreamList.search(params[:keyword])
  end

  private

  def dream_list_params
    params.require(:dream_list).permit(:dream, :period, :detail, :image, :category)
  end

  def period_get
    date = params[:dream_list][:period]
    Date.new date["period(1i)"].to_i,date["period(2i)"].to_i,pdate["period(3i)"].to_i
  end
end
