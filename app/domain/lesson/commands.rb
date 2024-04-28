module Lesson
  module Commands
    class AddLesson < Sequent::Command
      attrs course_id: Integer, title: String, content: String
      validates :course_id, presence: true
      validates :title, presence: true,
                length: { minimum: 5 }
      validates :content, presence: true
    end

    # class DestroyLesson < Sequent::Command
    # end
  end
end
