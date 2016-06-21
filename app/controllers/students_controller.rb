class StudentsController < ApplicationController

  get '/students' do
    @students = Student.all
    erb :'/students/index'
  end

  get '/students/new' do
    erb :'/students/new'
  end

  post '/students' do
    @student = Student.create(name: params[:student_name])
    @student.save
    redirect to "/students/#{@student.id}"
  end

  get '/students/:id' do
    @student = Student.find_by_id(params[:id])
    erb :'/students/show'
  end

end