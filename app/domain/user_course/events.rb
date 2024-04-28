module UserCourse
  module Events
    class UserCourseAdded < Sequent::Event
    end

    class UserCourseUserIdCourseIdChanged < Sequent::Event
      attrs user_id: Integer, course_id: Integer
    end

    class UserCourseDestroyed < Sequent::Event
    end
  end
end
