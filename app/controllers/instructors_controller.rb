class InstructorsController < ApplicationController
    before_action :find_instructor, only: [:show, :update, :destroy]

    # GET /instructors
    def index
        render json: Instructor.all, status: :ok
    end

    # GET /instructors/:id
    def show
        render json: @instructor, status: :ok
    end

    # POST /instructors
    def create
        new_instructor = Instructor.create!(instructor_params)
        render json: new_instructor, status: :created 
    end

    # PATCH  /instructors/:id
    def update
        @instructor.update!(instructor_params)
        render json: @instructor
    end

    # DELETE /instructors/:id
    def destroy
        @instructor.destroy
        head :no_content
    end

    private 

    def instructor_params
        params.permit(:name)
    end

    def find_instructor
        @instructor = Instructor.find(params[:id])
    end
end