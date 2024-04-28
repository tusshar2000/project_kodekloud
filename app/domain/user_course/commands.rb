module UserCourse
  module Commands
    class AddUserCourse < Sequent::Command
      attrs course_id: Integer
      validates :user_id, presence: true
      validates :course_id, presence: true
    end

    class DestroyUserCourse < Sequent::Command
    end
  end
end
