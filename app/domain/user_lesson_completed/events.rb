module UserLessonCompleted
  module Events
    class UserLessonCompletedAdded < Sequent::Event
    end

    class UserLessonCompletedAllValuesChanged < Sequent::Event
      attrs user_id: Integer, course_id: Integer, lesson_id: Integer, completed: Boolean
    end

    # class UserLessonCompletedDestroyed < Sequent::Event
    # end
  end
end
