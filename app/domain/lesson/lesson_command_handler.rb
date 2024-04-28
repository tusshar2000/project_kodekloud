module Lesson
  class LessonCommandHandler < Sequent::CommandHandler
    on Commands::AddLesson do |command|
      repository.add_aggregate Lesson.new(command)
    end

    # on Commands::DestroyLesson do |command|
    #   do_with_aggregate(command, Lesson) do |lesson|
    #     lesson.destroy
    #   end
    # end
  end
end
