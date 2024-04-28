module Lesson
  class LessonProjector < Sequent::Projector
    manages_tables LessonRecord

    on Events::LessonAdded do |event|
      create_record(LessonRecord, aggregate_id: event.aggregate_id)
    end

    on Events::LessonCourseIdChanged do |event|
      update_all_records(LessonRecord, { aggregate_id: event.aggregate_id }, event.attributes.slice(:course_id))
    end

    on Events::LessonTitleChanged do |event|
      update_all_records(LessonRecord, { aggregate_id: event.aggregate_id }, event.attributes.slice(:title))
    end

    on Events::LessonContentChanged do |event|
      update_all_records(LessonRecord, { aggregate_id: event.aggregate_id }, event.attributes.slice(:content))
    end

    # on Events::LessonDestroyed do |event|
    #   delete_all_records(LessonRecord, event.attributes.slice(:aggregate_id))
    # end
  end
end