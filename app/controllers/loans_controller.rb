class LoansController < ApplicationController

  get '/loans' do
    erb :'/loans/new'
  end
end