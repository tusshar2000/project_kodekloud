module Course
  class Course < Sequent::AggregateRoot
    def initialize(command)
      super(command.aggregate_id)
      apply Events::CourseAdded
      apply Events::CourseTitleChanged, title: command.title
      apply Events::CourseDescriptionChanged, description: command.description
      apply Events::CourseInstructorIdChanged, instructor_id: command.instructor_id
    end

    # def destroy
    #   apply Events::CourseDestroyed
    # end

    on Events::CourseAdded do
    end

    on Events::CourseTitleChanged do |event|
      @title = event.title
    end

    on Events::CourseDescriptionChanged do |event|
      @description = event.description
    end

    on Events::CourseInstructorIdChanged do |event|
      @instructor_id = event.instructor_id
    end

    # on Events::CourseDestroyed do
    # end
  end
end
