class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/products'
    else
      redirect_to '/login', alert: "Please verify email and/or password"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:order_id] = nil
    redirect_to '/'
  end
end