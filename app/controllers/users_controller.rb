class UsersController < ApplicationController

  get '/signup' do
      erb :signup
  end

  post '/signup' do
    if params[:password] == ""
      redirect '/signup'
    end
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    if user.username != "" && user.email != ""
      user.save
      session[:id] = user.id
      redirect to "/welcome"
    else
      redirect to '/signup'
    end
  end

  get '/login' do
      erb :login
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/welcome"
    else
      erb :login
    end
  end

  get '/welcome' do
    erb :welcome
  end
end