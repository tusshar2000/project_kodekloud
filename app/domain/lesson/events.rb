module Lesson
  module Events
    class LessonAdded < Sequent::Event
    end

    class LessonCourseIdChanged < Sequent::Event
      attrs course_id: String
    end

    class LessonTitleChanged < Sequent::Event
      attrs title: String
    end

    class LessonContentChanged < Sequent::Event
      attrs content: String
    end

    # class LessonDestroyed < Sequent::Event
    # end
  end
end
