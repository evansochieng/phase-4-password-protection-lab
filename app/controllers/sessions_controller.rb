class SessionsController < ApplicationController
  def create
    #find user
    user = User.find_by(username: params[:username])
    #check if the user is authenticated
    if user&.authenticate(params[:password])
      #set session ID and render user
      session[:user_id] = user.id
      render json: user, status: :ok
    else
      # raise error
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end

  def destroy
    #log out - remove user id from session hash
    session.delete :user_id
    head :no_content
  end
end
