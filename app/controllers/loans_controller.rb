class LoansController < ApplicationController

    get '/loans' do
    @book = Book.find_by_slug(params[:slug])
    if logged_in?
      erb :'loans/index'
    else
      redirect to '/login'
    end
  end

  get '/loans/new' do
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
    @student = Student.find_by_name(params[:name])
    @loan = @user.loans.create(name: params[:book_name], student_id: params[:student_id], book_id: params[:book_id])
    @loan.save
    redirect to "/loans/show"
     
  end

  get '/loans/show' do
    @loans = current_user.loans
    erb :'/loans/show'
  end

  post '/loans/show' do
    @user = current_user
    @loan = Loan.find_by_id(params[:id])
    @book = Book.find_by_slug(params[:slug])
    @loan.save
    redirect to "/books/#{@book.slug}"
  end

  patch '/loans/return' do
    redirect to "/books/#{@book.slug}"
  end

  delete '/loans/:slug/delete' do
    @book = Book.find_by_slug(params[:slug])
    @book.delete
    redirect to '/loans'
  end
  
end


