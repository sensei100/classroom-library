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
    @book.author = params[:author]
    @book.genre = params[:genre]
    @book.user_id = params[:user_id]
    @book.checked_out = params[:checked_out]
    @book.save
    redirect "/books/#{@book.slug}"
  end

  get '/books/:slug/edit' do
    @book = Book.find_by_slug(params[:slug])
    erb :'books/edit'
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

    get '/loans' do
    erb :'/loans/new'
  end

  post '/loans' do
    student_id = params.fetch('student_id').to_i()
    book_id = params.fetch('book_id').to_i()
    @loan = Loan.create(student_id: params[:student_id], book_id: params[:book_id])
    redirect to "/loans/show"
  end

  get '/loans/show' do
    erb :'loans/show'
  end

  patch '/loans/show' do
    @lendee = params[:student_id]
    @book = Book.find_by_slug(params[:slug])
    @book.checked_out = params[:checked_out]
    @book.save
    redirect to "/books/#{@book.slug}"
  end

end