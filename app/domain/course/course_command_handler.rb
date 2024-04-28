module Course
  class CourseCommandHandler < Sequent::CommandHandler
    on Commands::AddCourse do |command|
      repository.add_aggregate Course.new(command)
    end

    # on Commands::DestroyCourse do |command|
    #   do_with_aggregate(command, Course) do |course|
    #     course.destroy
    #   end
    # end
  end
end
