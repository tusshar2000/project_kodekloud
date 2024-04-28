module Lesson
  class Lesson < Sequent::AggregateRoot
    def initialize(command)
      super(command.aggregate_id)
      apply Events::LessonAdded
      apply Events::LessonCourseIdChanged, course_id: command.course_id
      apply Events::LessonTitleChanged, title: command.title
      apply Events::LessonContentChanged, content: command.content
    end

    # def destroy
    #   apply Events::LessonDestroyed
    # end

    on Events::LessonAdded do
    end

    on Events::LessonCourseIdChanged do |event|
      @course_id = event.course_id
    end

    on Events::LessonTitleChanged do |event|
      @title = event.title
    end

    on Events::LessonContentChanged do |event|
      @content = event.content
    end

    # on Events::LessonDestroyed do
    # end
  end
end
