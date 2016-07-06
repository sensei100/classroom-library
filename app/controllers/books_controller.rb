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
    @user = current_user
    @book = User.books.create(name: params[:name], author: params[:author], genre: params[:genre], user_id: session[:user_id], checked_out: params[:checked_out], student_id: params[:student_id]) 
    if @book.save
      redirect "/books/#{@book.slug}"
    else
      redirect to '/books/new'
    end
  end

  get '/books/:slug' do
    @book = Book.find_by_slug(params[:slug])
    if logged_in?
      erb :'books/show'
    else
      redirect to '/login'
    end
  end

  post '/books/:slug' do
    @user = current_user
    @book = Book.find_by_slug(params[:slug])
    @book.update(book: params[:book])
    @book.author = params[:author]
    @book.genre = params[:genre]
    @book.user_id = params[:user_id]
    @book.checked_out = params[:checked_out]
    @book.save
    redirect "/books/#{@book.slug}"
  end

  get '/books/:slug/edit' do
    @book = Book.find_by_slug(params[:slug])
    if logged_in?
      erb :'books/edit'
    else
      redirect to '/login'
    end
  end

  patch '/books/:slug' do
    @book = Book.find_by_slug(params[:slug])
    @book.author = params[:author]
    @book.genre = params[:genre]
    @book.save

    redirect to "/books/#{@book.slug}"
  end

  delete '/books/:slug/delete' do
    @book = Book.find_by_slug(params[:slug])
    @book.delete
    redirect to '/books'
  end

end
