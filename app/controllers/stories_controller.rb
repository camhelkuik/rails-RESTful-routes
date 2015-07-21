class StoriesController < ApplicationController
  
  def current_user
    if session[:user_id] == params["user_id"].to_i
      # @current_user = User.find(session[:user_id])
    else
      redirect "/"
    end
  end
  
  def user_stories 
    current_user
  
    @user = User.find(params["user_id"])
  
    @stories = Story.where("user_id = #{params["user_id"]}")
  end
  
  def new
    current_user
    @user = User.find(params["user_id"])
  end
  
  def save
    @story = Story.create({"title" => params["story"]["title"], "user_id" => params["user_id"]})
  
    redirect "/users/#{params["user_id"]}/stories"
  end
  
  def delete
    current_user
  
    @stories = Story.find(params["id"])
  
    @stories.delete
  
    redirect "/users/#{params["user_id"]}/stories"
  end
  
  def edit
    current_user
  
    @user = User.find(params["user_id"])
  
    @stories = Story.find(params["id"])
  end
  
  def save_edit
    @story = Story.find(params["id"]) 
    @story.title = params["story"]["title"]
  
    @story.save
  
    redirect "/users/#{params["user_id"]}/stories"
  end
end
