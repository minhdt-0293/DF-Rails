require "json_web_token"

class Api::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate params[:password]
      token = JsonWebToken.encode user_id: user.id
      user_info = User.get_info_user user.id
      render json: {status: :ok, user_info: user_info, jwt: token, message: "You logged in! Welcome back, #{user.username}"}
    else
      render json: {status: :unauthorized, message: "Log in failed! Username or password invalid!"}
    end
  end
end
