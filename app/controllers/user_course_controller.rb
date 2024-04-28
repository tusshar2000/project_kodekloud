class UserCourseController < ApplicationController

  def enroll_course
    authorize! :enroll_course, UserCourseRecord

    user_course = UserCourseRecord.find_by(user_id: @current_user.id,
                                           course_id: user_course_params[:course_id])
    if user_course.present?
      return render json: { message: "Already enrolled" },
                    status: :bad_request
    end
    
    Sequent.command_service.execute_commands(
      UserCourse::Commands::AddUserCourse.new(
        aggregate_id: Sequent.new_uuid,
        user_id: @current_user.id,
        course_id: user_course_params[:course_id]
      )
    )
    render json: { message: 'Enrolled Successfully' }, status: :created
  end

  def unenroll_course
    user_course = UserCourseRecord.find_by(user_id: @current_user.id,
                                           course_id: user_course_params[:course_id])
    if user_course.nil?
      return render json: { message: "Course not enrolled or already unenrolled" },
                    status: :bad_request
    end
    
    Sequent.command_service.execute_commands(
      UserCourse::Commands::DestroyUserCourse.new(
        aggregate_id: user_course.aggregate_id
      )
    )
    render json: { message: 'Unenrolled Successfully' }, status: :created
  end

  private

  def user_course_params
    params.permit(:course_id)
  end
end