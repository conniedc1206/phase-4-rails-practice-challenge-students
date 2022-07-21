class StudentsController < ApplicationController
    before_action :find_student, only: [:show, :update, :destroy]

    # GET /students
    def index
        render json: Student.all, status: :ok
    end

    # GET /students/:id
    def show
        render json: @student, include: :instructor
    end

    # POST /students
    def create
        new_student = Student.create!(student_params)
        render json: new_student, status: :created 
    end

    # PATCH  /students/:id
    def update
        @student.update!(student_params)
        render json: @student
    end

    # DELETE /students/:id
    def destroy
        @student.destroy
        head :no_content
    end

    private 

    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end

    def find_student
        @student = Student.find(params[:id])
    end
end