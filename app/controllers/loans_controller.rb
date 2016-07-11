class LoansController < ApplicationController

    get '/loans' do
      @loans = current_user.loans
      @books = current_user.books
      @students = current_user.students
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
    @book = Book.find_by(id: params[:book_id])
    @student = Student.find_by_name(params[:student_id])
    @loan = @user.loans.create(name: @book.name, student_id: params[:student_id], book_id: params[:book_id])
    @loan.save
    redirect to "/loans/:slug"
     
  end

  get '/loans/:slug' do
    @loans = current_user.loans
    @book = Book.find_by_slug(params[:slug])
    erb :'/loans/show'
  end

  post '/loans/:slug' do
    @user = current_user
    @loan = Loan.find_by_name(name: @books.name)
    @book = Book.find_by_slug(params[:slug])
    @loan.save
  end

  delete '/loans/:slug/delete' do
    @book = Book.find_by_slug(params[:slug])
    @loan = Loan.find_by(book_id: @book.id)
    @loan.delete
    redirect to '/loans'
  end
  
end


