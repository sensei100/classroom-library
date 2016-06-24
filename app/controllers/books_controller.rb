class BooksController < ApplicationController

  get '/books/new' do
    if !logged_in?
      redirect to '/login'
    else
    erb :'/books/new'
    end
  end

  get '/books' do
    if !logged_in?
      redirect to '/login'
    else
    erb :'books/index'
    end
  end

  post '/books' do
    @book = Book.create(:name => params[:book])
    @book.save
    redirect "/books/#{@book.slug}"
  end

  get '/books/:slug' do
    @book = Book.find_by_slug(params[:slug])
    erb :'books/show'
  end

end