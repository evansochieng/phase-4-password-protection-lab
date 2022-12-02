class UsersController < ApplicationController
  def create
    # create new user
    user = User.create(user_params)
    # check if the user was signed-up successfully
    if user.valid?
      #save user id in the session
      session[:user_id] = user.id
      render json: user, status: :created
    else
      #if no matching password confirmation, raise error
      render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    #find user
    user = User.find_by(id: session[:user_id])

    #check if the user is authenticated
    if user
      render json: user, status: :ok
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
    
  end

  private
  #strong params
  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
