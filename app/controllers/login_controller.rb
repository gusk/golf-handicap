class LoginController < ApplicationController
  before_action :login_filter

  private

  def login_filter
    if !current_user
      redirect_to new_session_path
    end
  end
end