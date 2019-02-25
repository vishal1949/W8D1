class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      login(user)
      render :root
    else
  end

  def destroy
    if current_user
      logout
    else 
      render json: {}, status: 404
    end
  end
end
