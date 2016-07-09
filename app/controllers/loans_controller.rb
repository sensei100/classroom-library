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
    @lendee = params[:student_id]
    @loan.save
    redirect to "/loans/show"
  end

  get '/loans/show' do
    @loan = Loan.find_by_id(book_id: params[:book_id])
    erb :'loans/show'
  end
  
end


