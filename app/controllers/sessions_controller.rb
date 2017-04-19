class SessionsController < ApplicationController

  def new
  end

  def index
  end

  def create
    user = User.find_by_email params[:email]
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged In!'
    else
      flash.now[:alert] = 'Something went wrong!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Thanks for Coming!'
  end

end
