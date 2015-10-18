class UsersController < ApplicationController
  include SessionHelper
  before_action :ensureAdmin
  layout "admin"

  def list
    @current = User.find(session[:user_id])
    @section = 'Users'
    @active = 'users'
    @users = User.all
  end

  def new
    @current = User.find(session[:user_id])
    @section = 'Users'
    @active = 'users'
    @states = State.all
  end

  def submit
    hashid = Hashids.new('carikerjaan indonesia',8)
    currentUser = User.create({
      user_name: params[:user][:name],
      user_email: params[:user][:email],
      password: params[:user][:password],
      user_role: params[:user][:role],
      user_state: params[:user][:state],
      user_city: params[:user][:city],
      avatar: params[:user][:avatar]
    })

    usid = User.find(currentUser.id)
    usid.user_hash_id = hashid.encode(currentUser.id)
    usid.save

    redirect_to '/admin/users'
  end

  def edit
    @current = User.find(session[:user_id])
    @section = 'Users'
    @active = 'users'
    @editUser = User.where(:user_hash_id => params[:ids]).first
    @states = State.all
    @cities = City.where(:state_id => @editUser.user_state)
    @roles = Role.all
  end

  def update
    @editUser = User.where(:user_hash_id => params[:ids]).first
    @editUser.user_name = params[:user][:name]
    @editUser.user_email = params[:user][:email]
    @editUser.user_role = params[:user][:role]
    @editUser.password = params[:user][:password]
    @editUser.user_state = params[:user][:state]
    @editUser.user_city = params[:user][:city]

    if params[:user][:avatar]
      @editUser.avatar = params[:user][:avatar]
    end

    @editUser.save

    redirect_to '/admin/users'
  end

end
