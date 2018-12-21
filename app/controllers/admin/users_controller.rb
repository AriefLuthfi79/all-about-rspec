class Admin::UsersController < ApplicationController
  before_action :is_admin, only: [:create, :new]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(email: resource_params[:email], password: generated_password)
    response = ->(object) { object.save ? redirect_to(admin_users_path) : redirect_to(new_admin_user_path) }
    response.call(user)
  end

  private

  def resource_params
    params.require(:user).permit(:email)
  end

  def is_admin
    redirect_to root_path unless current_user.has_role? :admin
  end

  def generated_password
    Devise.friendly_token.first(8)
  end
end
