class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have signed up successfully."
      redirect_to projects_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.save
    flash[:notice] = "You have successfully updated your profile."
    redirect_to @user
  end

  private
    def user_params
      params.require(:user).permit(:name, 
        :email, 
        :password, 
        :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
