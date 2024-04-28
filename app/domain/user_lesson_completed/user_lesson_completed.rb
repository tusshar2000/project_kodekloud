module UserLessonCompleted
  class UserLessonCompleted < Sequent::AggregateRoot
    def initialize(command)
      super(command.aggregate_id)
      apply Events::UserLessonCompletedAdded
      apply Events::UserLessonCompletedAllValuesChanged, user_id: command.user_id,
                                                         course_id: command.course_id,
                                                         lesson_id: command.lesson_id,
                                                         completed: command.completed
    end

    # def destroy
    #   apply Events::UserLessonCompletedDestroyed
    # end

    on Events::UserLessonCompletedAdded do
    end

    on Events::UserLessonCompletedAllValuesChanged do |event|
      @user_id = event.user_id
      @course_id = event.course_id
      @lesson_id = event.lesson_id
      @completed = event.completed
    end

    # on Events::UserLessonCompletedDestroyed do
    # end
  end
end
