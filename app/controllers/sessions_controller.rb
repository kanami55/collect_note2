class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create, :destroy]

  def new
  end

  def create
    user = User.find_by(email: session_params[:email]) # 該当するユーザーを探す
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to dream_lists_path
      flash[:notice] = "ログインしました。"
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
    flash[:notice] = "ログアウトしました。"
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
