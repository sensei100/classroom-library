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
    @book = Book.find_by_slug(params[:slug])
    @loan = @user.loan.create(student_id: params[:student_id], book_id: params[:book_id])
    @book.update(book: params[:book])
    @lendee = params[:student_id]
    @book.checked_out = lendee
    @book.save
    redirect to '/books/index'
    redirect to "/loans/show"
  end

  get '/loans/show' do
    erb :'loans/show'
  end
  
end