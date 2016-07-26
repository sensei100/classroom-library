class BooksController < ApplicationController

  get '/books' do
   if !logged_in?
      redirect to '/login'
    else
      @books = current_user.books
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
    @book = @user.books.create(name: params[:name], author: params[:author], genre: params[:genre]) 
    if @book.save
      redirect "/books/#{@book.slug}"
    else
      flash[:message] = "Please complete all fields to continue."
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
    @student = current_user.student
    @book.update(book: params[:book])
    @book.author = params[:author]
    @book.genre = params[:genre]
    @book.user_id = params[:user_id]
    if @book.save
    redirect "/books/#{@book.slug}"
    else
      flash[:message] = "Please complete all fields."
      erb :"/books/#{@book.slug}/edit"
    end
  end

  get '/books/:slug/edit' do
    @book = Book.find_by_slug(params[:slug])
    if logged_in?
      erb :'books/edit'
    else
      flash[:message] = "Please login to continue."
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
