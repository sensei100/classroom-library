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
    @loan = @user.loans.create(student_id: params[:student_id], book_id: params[:book_id])
    @loan.save
    redirect to "/loans/#{@book.slug}"
  end

  get '/loans/show' do
    @book = Book.find_by_slug(params[:slug])
    @student = Student.find_by_name(params[:name])
    erb :'loans/show'
  end

  delete '/loans/:slug/delete' do
    @book = Book.find_by_slug(params[:slug])
    @book.delete
    redirect to '/loans'
  end
  
end


