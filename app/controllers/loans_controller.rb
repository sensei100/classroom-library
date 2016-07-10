class LoansController < ApplicationController

  get '/loans' do
    if !logged_in?
      redirect to '/login'
    else
      @loans = current_user.loans
      @books = current_user.books
      @students = current_user.students
    erb :'/loans/new'
    end
  end

  post '/loans' do
    @user = current_user
    @student = Student.find_by_name(params[:name])
    @loan = @user.loans.create(loans: params[:book_name], student_id: params[:student_id], book_id: params[:book_id])
    if @loan.save
      redirect "/loans/#{@book.slug}"
    else
      redirect to '/books/new'
    end
  end

  get '/loans/show' do
    @book = Book.find_by_slug(params[:slug])
    @student = Student.find_by_name(params[:name])
    erb :'loans/show'
  end

  patch '/loans/:slug/return' do
    @book = Book.find_by_slug(params[:slug])
    @book.author = params[:author]
    @book.genre = params[:genre]
    @book.save

    redirect to "/books/#{@book.slug}"
  end

  delete '/loans/:slug/delete' do
    @book = Book.find_by_slug(params[:slug])
    @book.delete
    redirect to '/loans'
  end
  
end


