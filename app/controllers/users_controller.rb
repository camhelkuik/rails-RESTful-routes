class UsersController < ApplicationController
  
  def current_user
    if session[:user_id] == params["id"].to_i
      # @current_user = User.find(session[:user_id])
    else
      redirect "/users"
  end
  
  def home 
    @users = User.all    
  end
  
  def delete 
    current_user
    User.delete(params["id"])
  
    redirect "/users"
  end
  
  def edit
    current_user
    @users = User.find(params["id"])
    erb :"/users/edit"
  end
  
  def save
    @users = User.find(params["id"])
  
    @users.email = params["users"]["email"]
  
    @users.save
  
    redirect "/users"
  end
  
end

