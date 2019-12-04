class Api::UsersController < ApplicationController
  def update
    user = User.find params[:id]

    user.update user_params
    render json: {status: :ok, user_info: user.user_info(request.base_url)}
  end

  private

  def user_params
    params.require(:user).permit User::USER_ATTRIBUTES
  end
end
