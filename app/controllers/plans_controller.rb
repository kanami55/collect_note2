class PlansController < ApplicationController
  def create
    @plan = current_user.plans.new(plan_params)
    if @plan.save
      redirect_to plans_path
      flash[:notice] = "登録しました。"
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
    respond_to do |format|
      format.html
      format.js
    end
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

  def destroy
    @plan = current_user.plans.find(params[:id])
    @plan.destroy
    redirect_to plans_path
    flash[:notice] = "予定を１つ削除しました。"
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :content, :start_time)
  end
end
