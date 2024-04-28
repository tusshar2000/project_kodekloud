class UserLessonCompletedController < ApplicationController

  def lesson_completed
    course = CourseRecord.find_by(id: user_lesson_completed_params[:course_id])
    if course.nil?
      return render json: { message: "Course not found" },
                    status: :bad_request
    end

    lesson = LessonRecord.find_by(id: user_lesson_completed_params[:lesson_id])
    if lesson.nil?
      return render json: { message: "lesson not found" },
                    status: :bad_request
    end

    user_course = UserCourseRecord.find_by(user_id: @current_user.id,
                                           course_id: user_lesson_completed_params[:course_id])
    if user_course.nil?
      return render json: { message: "Course not enrolled" },
                    status: :bad_request
    end

    user_lesson_completed = UserLessonCompletedRecord.find_by(user_id: @current_user.id,
                                                              course_id: user_lesson_completed_params[:course_id],
                                                              lesson_id: user_lesson_completed_params[:lesson_id],
                                                              completed: true)
    if user_lesson_completed.present?
      return render json: { message: "Lesson Already Completed" },
                    status: :bad_request
    end

    Sequent.command_service.execute_commands(
      UserLessonCompleted::Commands::AddUserLessonCompleted.new(
        aggregate_id: Sequent.new_uuid,
        user_id: @current_user.id,
        course_id: user_lesson_completed_params[:course_id],
        lesson_id: user_lesson_completed_params[:lesson_id],
        completed: true
      )
    )
    render json: { message: 'Lesson Completed' }, status: :created
  end

  private

  def user_lesson_completed_params
    params.permit(:course_id, :lesson_id)
  end
end