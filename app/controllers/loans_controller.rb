class LoansController < ApplicationController

  get '/loans' do
    erb :'/loans/new'
  end

  post '/loans' do
    @loan = Loan.create(params[:loan])
    redirect to "/books/index"
  end
end