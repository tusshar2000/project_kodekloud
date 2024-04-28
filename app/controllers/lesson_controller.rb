class LessonController < ApplicationController

  def create_lesson
    authorize! :create_lesson, LessonRecord

    @course = CourseRecord.find_by(id: lesson_params[:course_id], instructor_id: @current_user.id)
    if @course.nil?
      return render json: { message: "Course doesn't exist or not created by logged in user" },
                    status: :not_found
    end
    
    Sequent.command_service.execute_commands(
      Lesson::Commands::AddLesson.new(
        aggregate_id: Sequent.new_uuid,
        course_id: @course.id,
        title: lesson_params[:title],
        content: lesson_params[:title]
      )
    )
    render json: { message: 'Lesson Created Successfully' }, status: :created
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :content, :course_id)
  end
end