class BooksController < ApplicationController

  get '/books' do
   if !logged_in?
      redirect to '/login'
    else
      @books = Book.all
      erb :'books/index'
    end
  end

  get '/books/new' do
    if !logged_in?
      redirect to '/login'
    else
      erb :'/books/new'
    end
  end

  post '/books' do
    @book = Book.create(name: params[:name], author: params[:author], genre: params[:genre])
    redirect "/books/#{@book.slug}"
  end

  get '/books/:slug' do
    @book = Book.find_by_slug(params[:slug])
    erb :'books/show'
  end

  post '/books/:slug' do
    @book = Book.find_by_slug(params[:slug])
    @book.update(params[:book])
  end

  get '/books/:slug/edit' do
    @book = Book.find_by_slug(params[:slug])
    erb :'books/edit'
  end

  patch '/books/:slug' do
    @book = Book.find_by_slug(params[:slug])
    @book.save

    redirect to "/books/#{@book.slug}"
  end

  delete '/books/:slug/delete' do
    @book = Book.find_by_slug(params[:slug])
    @book.delete
    redirect to '/books'
  end

end