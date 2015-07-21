class LoginsController < ApplicationController
  
  def login
    @user = User.new
  end
  
  def save_signup
    the_password = BCrypt::Password.create(params["user"]["password"])
    new_user = User.create({"email" => params["user"]["email"], "password" => the_password})
  
    if new_user.errors.messages.length == 0

      session[:user_id] = new_user.id

      redirect "/users/#{new_user.id}/stories"
    else
      @errors = "Invalid Login"
      erb :"/logins/login"
    end
  end
    
  def verify_login
    attempted_password = params["user"]["password"]
    @user = User.where("email" => params["user"]["email"])
    # Assuming there is a user with the given email address...
    # Make a new BCrypt object with the **password from the database**.
  
    actual_password = BCrypt::Password.new(@user[0].password)
  
    session[:user_id] = @user[0].id
    # So, an example:
    # actual_password = BCrypt::Password.new("$2a$10$87jFZs7pY2Fh33HR.lA9ouVLzevh45esv0UjdYF/b1jOGKC.YtfG2")

    if actual_password == attempted_password
      redirect "/users/#{@user[0].id}/stories"
    else
      @user.errors << "Invalid login."
    
      erb :"/logins/login"
    end
  end
    
  def logout
    session.clear
    redirect "/"
  end
end


