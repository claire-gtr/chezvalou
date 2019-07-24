class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def authenticate_admin!
    redirect_to new_user_session_path unless current_user.admin
  end
end
