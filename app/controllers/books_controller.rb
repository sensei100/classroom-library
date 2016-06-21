class BooksController < ApplicationController

  get '/books/new' do
    if !logged_in?
      redirect to '/login'
    else
    erb :'/books/new'
    end
  end

  get '/books/index' do
    if !logged_in?
      redirect to '/login'
    else
    erb :'books/index'
    end
  end
end