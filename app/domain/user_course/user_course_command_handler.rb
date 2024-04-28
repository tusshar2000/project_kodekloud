module UserCourse
  class UserCourseCommandHandler < Sequent::CommandHandler
    on Commands::AddUserCourse do |command|
      repository.add_aggregate UserCourse.new(command)
    end

    on Commands::DestroyUserCourse do |command|
      do_with_aggregate(command, UserCourse) do |user_course|
        user_course.destroy
      end
    end
  end
end
