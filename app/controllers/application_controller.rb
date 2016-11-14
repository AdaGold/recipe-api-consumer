class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exce ption.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
