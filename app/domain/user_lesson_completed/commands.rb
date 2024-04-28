module UserLessonCompleted
  module Commands
    class AddUserLessonCompleted < Sequent::Command
      attrs course_id: Integer, lesson_id: Integer, completed: Boolean
      validates :user_id, presence: true
      validates :course_id, presence: true
      validates :lesson_id, presence: true
    end

    # class DestroyPost < Sequent::Command
    # end
  end
end
