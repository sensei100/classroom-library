class LoansController < ApplicationController

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
    lendee = params[:student_id]
    book = Book.find_by_slug(params[:slug])
    book.checked_out = lendee
    book.save
    redirect to '/books/index'
  end
end