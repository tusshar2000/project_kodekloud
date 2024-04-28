module UserLessonCompleted
  class UserLessonCompletedCommandHandler < Sequent::CommandHandler
    on Commands::AddUserLessonCompleted do |command|
      repository.add_aggregate UserLessonCompleted.new(command)
    end

    # on Commands::DestroyUserLessonCompleted do |command|
    #   do_with_aggregate(command, UserLessonCompleted) do |user_lesson_completed|
    #     user_lesson_completed.destroy
    #   end
    # end
  end
end
