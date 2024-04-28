module Course
  class CourseProjector < Sequent::Projector
    manages_tables CourseRecord

    on Events::CourseAdded do |event|
      create_record(CourseRecord, aggregate_id: event.aggregate_id)
    end

    on Events::CourseTitleChanged do |event|
      update_all_records(CourseRecord, { aggregate_id: event.aggregate_id }, event.attributes.slice(:title))
    end

    on Events::CourseDescriptionChanged do |event|
      update_all_records(CourseRecord, { aggregate_id: event.aggregate_id }, event.attributes.slice(:description))
    end

    on Events::CourseInstructorIdChanged do |event|
      update_all_records(CourseRecord, { aggregate_id: event.aggregate_id }, event.attributes.slice(:instructor_id))
    end

    # on Events::CourseDestroyed do |event|
    #   delete_all_records(CourseRecord, event.attributes.slice(:aggregate_id))
    # end
  end
end