class UsersController < ApplicationController
include ActiveModel::MassAssignmentSecurity
	before_filter :is_admin, :only => [:index, :destroy]

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to @user
    else
      render :action => 'new'
    end
  end
  

  def update
    @user = User.find(params[:id])

  	#if current_user.admin
  	#	@user.admin == params[:user][:admin]
    #  sanitize (params[:user][:admin] = nil)
  	#end
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to @user
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end
end

