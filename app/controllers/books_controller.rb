class BooksController < ApplicationController

  get '/books/new' do
    erb :'/books/new'
  end

  get '/books/index' do
    erb :'books/index'
  end
end