class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'お帰りなさい'
      redirect_to root_url
    else
      flash.now[:danger] = 'メールアドレス/パスワードが間違っています'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
