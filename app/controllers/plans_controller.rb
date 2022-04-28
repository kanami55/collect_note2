class PlansController < ApplicationController

  def create
    @plan = current_user.plans.new(plan_params)
    if @plan.save
      redirect_to plans_path
      flash[:notice] = "登録しました。"
    else
      render :new
    end
  end

  def index
    @plan = Plan.new
    @plans = current_user.plans
  end

  def show
    @plan = current_user.plans.find(params[:id])
  end

  def edit
    @plan = current_user.plans.find(params[:id])
  end

  def update
    @plan = current_user.plans.find(params[:id])
    if @plan.update(plan_params)
      redirect_to plans_path
      flash[:notice] = "更新に成功しました。"
    else
      render :edit
    end
  end

  def destory
    @plan = current_user.plans.find(params[:id])
    @plan.destroy
    flash[:notice] = "削除しました。"
    redirect_to plans_path
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :content, :start_time, :user_id)
  end
end
