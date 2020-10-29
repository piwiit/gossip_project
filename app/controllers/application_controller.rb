# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user, only: [:index]
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def authenticate_user
    unless current_user
      flash[:danger] = 'Please log in.'
      redirect_to new_session_path
    end
  end
end
