class UsersController < ApplicationController

   get '/signup' do
    if !logged_in?
      erb :signup
    else
      redirect to '/welcome'
    end
  end

  post '/signup' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    if user.username != "" && user.email != "" 
      user.save
      session[:user_id] = user.id
      redirect to "/welcome"
    else
      flash[:message] = "Please complete all fields to continue."
      erb :signup
    end
  end

  get '/login' do
    if logged_in?
      redirect to '/welcome'
    else
      erb :login
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/welcome"
    else
      flash[:message] = "Please complete all fields to continue."
      erb :login
    end
  end

  get '/welcome' do
    erb :welcome
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect
      '/'
    end
  end
end