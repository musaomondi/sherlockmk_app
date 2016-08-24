class UsersController < ApplicationController
  def index
  @users = User.order(params[:sort])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      flash[:success] = "You successfully signed up"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end


  private
  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation
    )
  end
end
