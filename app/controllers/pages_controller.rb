class PagesController < ApplicationController
  def index
    response = Http.get("http://localhost:3000/skeletons.json")
  @user_name = session[:user_name] 
   @skeletons = JSON.parse response
  end
end
