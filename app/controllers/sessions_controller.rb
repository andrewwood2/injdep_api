class SessionsController < Devise::SessionsController
  def create
    user = User.find_by_username(sign_in_params[:username])
    if user && user.valid_password?(sign_in_params[:password])
      @current_user = user
    else
      render json: { errors: { 'username or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end
end
