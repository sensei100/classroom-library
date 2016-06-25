class StudentsController < ApplicationController

  get '/students' do
    @students = Student.all
    erb :'/students/index'
  end

  get '/students/new' do
    erb :'/students/new'
  end

  post '/students' do
    @student = Student.create(name: params[:name])
    redirect to "/students/#{@student.slug}"
  end

  get '/students/:name' do
    @student = Student.find_by_name(params[:name])
    erb :'/students/show'
  end

  delete '/students/:name/delete' do
    @student = Student.find_by_name(params[:name])
    @student.delete
    redirect to '/students'
  end
end