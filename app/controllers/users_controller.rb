class UsersController < ApplicationController
  def show
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver_now!
        format.html { redirect_to('/login', notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
        # flash[:success] = "Welcome"
        # session[:user_id] = @user.id
        # redirect_to '/'
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        # flash[:notice] = "Please, register again"
        # redirect_to '/users/new'
      end
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name)
  end
end
