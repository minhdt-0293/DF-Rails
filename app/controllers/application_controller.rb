require "json_web_token"

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user

  def authenticate_user
    decode_token = JsonWebToken.decode request.headers[:token]&.to_s
    return render(json: {status: :not_found, message: "Not Found"}) if decode_token.nil?
    user_id = decode_token.first["user_id"]
    user = User.find_by(id: user_id)
    return render json: {status: :unauthorized, message: "Something was wrong"} if user.blank?
  end
end
