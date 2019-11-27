class ApplicationController < ActionController::Base
  before_action :authenticate_user

  def authenticate_user
    decode_token = JsonWebToken.decode request.headers[:token]
    user_id = decode_token.first["user_id"]
    user = User.find_by(id: user_id)
    return render json: {status: :unauthorized, message: "Something was wrong"} if user.blank?
  end
end
