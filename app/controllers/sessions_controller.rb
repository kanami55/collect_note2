class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: sessions_params[:email]) # 該当するユーザーを探
    if user&.authenticate(sessions_params[:password])
      sessions[:user_id] = user.id
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

  def sessions_params
    params.require(:session).permit(:email, :password)
  end
end
