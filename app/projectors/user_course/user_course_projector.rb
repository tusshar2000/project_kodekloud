module UserCourse
  class UserCourseProjector < Sequent::Projector
    manages_tables UserCourseRecord

    on Events::UserCourseAdded do |event|
      create_record(UserCourseRecord, aggregate_id: event.aggregate_id)
    end

    on Events::UserCourseUserIdCourseIdChanged do |event|
      update_all_records(UserCourseRecord, { aggregate_id: event.aggregate_id }, event.attributes.slice(:user_id, :course_id))
    end

    on Events::UserCourseDestroyed do |event|
      delete_all_records(UserCourseRecord, event.attributes.slice(:aggregate_id))
    end
  end
end