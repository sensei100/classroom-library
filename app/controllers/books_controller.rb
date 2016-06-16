class BooksController < ApplicationController

  get '/books' do
    "Hello World"
  end

  get '/books/new' do
    erb :'/books/new'
  end

end