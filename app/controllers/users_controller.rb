class UsersController < ApplicationController
  before_action :load_user, only: %I[show destroy edit update]
  before_action :logged_in_user, only: %I[index edit update destroy new]
  before_action :correct_user, only: %I[edit update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.all
  end

  def show
    return if @user.activated?
    flash[:danger] = t "controller.user.error_activate"
    redirect_to users_url
  end

  def new
    @user = User.new
  end

  def create # post
    @user = User.new user_params
    @user.save
    if @user.save
      @user.send_activation_email
      flash[:info] = t "controller.user.create.info"
      redirect_to users_url
    else
      render :new
    end
  end

  def edit; end

  def update # patch
    if @user.update_attributes user_params
      flash[:success] = t "controller.user.updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t "controller.user.destroy.success"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :schools, :role, :avatar, :graduation
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "controller.user.error_id"
    redirect_to users_url
  end
end
