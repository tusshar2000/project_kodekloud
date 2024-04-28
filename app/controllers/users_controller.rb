class UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:create]

  def create 
    @user = User.new(user_params)
    if @user.save
      render json: { id: @user.id, message: 'User Created Successfully' }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def me 
    render json: @current_user, status: :ok
  end

  def user_course_details
    authorize! :course_details, User

    details = []
    enrolled_course_ids = UserCourseRecord.where(user_id: @current_user.id).pluck(:course_id)
    enrolled_course_ids.each do |enrolled_course_id|
      course_lessons_completed_count = UserLessonCompletedRecord.where(user_id: @current_user.id,
                                                                       course_id: enrolled_course_id,
                                                                       completed: true)
                                                                .count
      course_total_lessons_count = LessonRecord.where(course_id: enrolled_course_id)
                                               .count
      course_completion_percentage = ((course_lessons_completed_count.to_f / course_total_lessons_count)*100).round(2)
      details << {course_id: enrolled_course_id, completion_percentage: course_completion_percentage}
    end
    render json: details, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :role, :username)
  end
end