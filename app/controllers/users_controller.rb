class UsersController < ApplicationController

  get '/signup' do
      erb :signup
  end

  post '/signup' do
    if params[:password] == ""
      redirect '/signup'
    end
    user = User.new(params)
    if user.username != "" && user.email != ""
      user.save
      session[:id] = user.id
      redirect to "/books"
    else
      redirect to '/signup'
    end
  end

end