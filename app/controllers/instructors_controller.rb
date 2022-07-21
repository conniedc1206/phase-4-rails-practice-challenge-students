class InstructorsController < ApplicationController
    # GET /instructors
    def index
        render json: Instructor.all, status: :ok
    end

    # GET /instructors/:id
    def show
        instructor = Instructor.find(params[:id])
        render json: instructor
    end

    # POST /instructors
    def create
        new_instructor = Instructor.create!(instructor_params)
        render json: new_instructor, status: :created 
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    # PATCH  /instructors/:id
    def update
        instructor = Instructor.find(params[:id])
        instructor.update!(instructor_params)
        render json: instructor
    rescue ActiveRecord::RecordNotFound => error
        render json: { message: error.message }, status: :not_found
    end

    # DELETE /instructors/:id
    def destroy
        instructor = Instructor.find(params[:id])
        instructor.destroy
        head :no_content
    rescue ActiveRecord::RecordNotFound => error
        render json: { message: error.message }, status: :not_found
    end

    private 

    def instructor_params
        params.permit(:name)
    end

end