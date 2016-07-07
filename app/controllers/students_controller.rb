class StudentsController < ApplicationController

  get '/students' do
    @students = current_user.students
    erb :'/students/index'
  end

  get '/students/new' do
    erb :'/students/new'
  end

  post '/students' do
    @user = current_user
    @student = @user.students.create(name: params[:name])
    redirect to "/students/#{@student.name}"
  end

  get '/students/:name' do
    @student = Student.find_by_name(params[:name])
    erb :'/students/show'
  end

  get '/students/:name/edit' do
    @student = Student.find_by_name(params[:name])
    erb :'students/edit'
  end

  patch '/students/:name' do
    @student = Student.find_by_name(params[:name])
    @student.save

    redirect to "/students/#{@student.name}"
  end

  delete '/students/:name/delete' do
    @student = Student.find_by_name(params[:name])
    @student.delete
    redirect to '/students'
  end
end