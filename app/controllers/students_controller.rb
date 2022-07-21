class StudentsController < ApplicationController
    # GET /students
    def index
        render json: Student.all, status: :ok
    end

    # GET /students/:id
    def show
        student = Student.find(params[:id])
        render json: student, include: :instructor
    end

    # POST /students
    def create
        new_student = Student.create!(student_params)
        render json: new_student, status: :created 
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    # PATCH  /students/:id
    def update
        student = Student.find(params[:id])
        student.update!(student_params)
        render json: student
    rescue ActiveRecord::RecordNotFound => error
        render json: { message: error.message }, status: :not_found
    end

    # DELETE /students/:id
    def destroy
        student = Student.find(params[:id])
        student.destroy
        head :no_content
    rescue ActiveRecord::RecordNotFound => error
        render json: { message: error.message }, status: :not_found
    end

    private 
    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end
end