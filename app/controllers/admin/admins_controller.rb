class Admin::AdminsController < ApplicationController

  def create
    current_resource.add_role :admin
    redirect_to root_path
  end

  def destroy
    current_resource.remove_role :admin
    redirect_to root_path
  end

  private

  def current_resource
    User.find_by(id: params[:user_id])
  end
end
