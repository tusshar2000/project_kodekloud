VIEW_SCHEMA_VERSION = 5

class SequentMigrations < Sequent::Migrations::Projectors
  def self.version
    VIEW_SCHEMA_VERSION
  end

  def self.versions
    {
      '1' => [

      ],
      '2' => [
        Course::CourseProjector
      ],
      '3' => [
        Lesson::LessonProjector
      ],
      '4' => [
        UserCourse::UserCourseProjector
      ],
      '5' => [
        UserLessonCompleted::UserLessonCompletedProjector
      ]
    }
  end
end
