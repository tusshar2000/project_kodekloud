# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
      if user.instructor?
        can :create_course, CourseRecord
        can :create_lesson, LessonRecord
      elsif user.student?
        can :enroll_course, UserCourseRecord
        can :course_details, User
      end
  end
end
