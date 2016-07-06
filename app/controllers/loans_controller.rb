class LoansController < ApplicationController

  get '/loans' do
    erb :'/loans/new'
  end

  post '/loans' do
    @book = Book.find_by_slug(params[:slug])
    @loan = Loan.create(student_id: params[:student_id], book_id: params[:book_id])
    @book.update(book: params[:book])
    @lendee = params[:student_id]
    @book = Book.find_by_slug(params[:slug])
    @book.checked_out = lendee
    @book.save
    redirect to '/books/index'
    redirect to "/loans/show"
  end

  get '/loans/show' do
    erb :'loans/show'
  end
  
end