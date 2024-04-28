module Course
  module Commands
    class AddCourse < Sequent::Command
      attrs title: String, description: String, instructor_id: Integer
      validates :title, presence: true,
                length: { minimum: 5 }
      validates :instructor_id, presence: true
    end

    # class DestroyPost < Sequent::Command
    # end
  end
end
