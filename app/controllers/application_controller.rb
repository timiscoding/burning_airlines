class ApplicationController < ActionController::Base
  before_action :current_user # before doing any action in any controller, call current_user method
  before_action :check_if_logged_in
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    if session[:user_id].present? # check if client sent back a session
      # find the user with user id from session cookie and set it to an instance
      # variable so all controllers can access it
      @current_user = User.find_by :id => session[:user_id]
      # set to nil so client stops sending invalid session data with every request
      session[:user_id] = nil if @current_user.nil?
    end
  end

  def check_if_logged_in
    controller = params[:controller]
    action = params[:action]
    unless (controller == 'sessions' && action == 'new') ||
          (controller == 'sessions' && action == 'create') ||
          (controller == 'users' && action == 'new') ||
          (controller == 'users' && action == 'create') ||
          @current_user.present?
      redirect_to login_path
    end
  end
end
