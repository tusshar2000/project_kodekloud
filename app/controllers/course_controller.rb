class CourseController < ApplicationController

  def create_course
    authorize! :create_course, CourseRecord
    
    Sequent.command_service.execute_commands(
      Course::Commands::AddCourse.new(
        aggregate_id: Sequent.new_uuid,
        title: course_params[:title],
        description: course_params[:title],
        instructor_id: @current_user.id
      )
    )
    render json: { message: 'Course Created Successfully' }, status: :created
  end

  private

  def course_params
    params.require(:course).permit(:title, :description)
  end
end