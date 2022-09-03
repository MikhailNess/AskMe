class SessionsController < ApplicationController
  def create
    user_params = params.require(:session)
    user = User.find_by(email: user_params[:email])
    user =
      User.find_by(email: user_params[:email])&.authenticate(
        user_params[:password]
      )
    if user.present?
      session[:user_id] = user.id
      redirect_to root_path, notice: "Вы вошли на сайт"
    else
      flash.now[:alert] = "Не правильный пароль или email"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Вы вышли из аккаунта"
  end
end

  def new
  end
