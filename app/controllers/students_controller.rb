class StudentsController < ApplicationController

  get '/students' do
    erb :'/students/index'
  end

  get '/students/new' do
    erb :'/students/new'
  end

  post '/students' do
    erb :'/students/index'
  end

end