module UserCourse
  class UserCourse < Sequent::AggregateRoot
    def initialize(command)
      super(command.aggregate_id)
      apply Events::UserCourseAdded
      apply Events::UserCourseUserIdCourseIdChanged, user_id: command.user_id, course_id: command.course_id
    end

    def destroy
      apply Events::UserCourseDestroyed
    end

    on Events::UserCourseAdded do
    end

    on Events::UserCourseUserIdCourseIdChanged do |event|
      @user_id = event.user_id
      @course_id = event.course_id
    end

    on Events::UserCourseDestroyed do
    end
  end
end
