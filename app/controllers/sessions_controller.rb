class SessionsController < ApplicationController

def new
end

#def create
#  user = User.authenticate(params[:name], params[:password])
#  if user
#    session[:user_id] = user.id
#    redirect_to root_url, :notice => "Logged in!"
#  else
#    flash.now.alert = "Invalid name or password"
#    render "new"
#  end
#end

def create
	#if we have params means that we didn't authentificate by facebook
	if(params[:name] == nil)
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
	else
		user = User.authenticate(params[:name], params[:password])
	end

	if user
		session[:user_id] = user.id
		redirect_to :back, :notice => "Logged in!"
	else
		redirect_to new_user_path, :notice => "Invalid name or password"
	end
end

def destroy
  session[:user_id] = nil
  redirect_to :back, :notice => "Logged out!"
end


end
