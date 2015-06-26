class SessionController < ApplicationController
  def new
  end

  def create

    http_response = Http.post("http://localhost:3000/auth.json", json: {email: params[:session][:email], password: params[:session][:password]})

    if http_response.code == 201
      user = JSON.parse(http_response)
      session[:user_name] = user["user_name"]
      session[:token] = user["token"]
      redirect_to root_path
    else
      flash.now[:alert] = "Auth failed Bro"
      render :new
    end
  end

  def destroy
    session.delete(:user_name)
    redirect_to root_path
  end

end
