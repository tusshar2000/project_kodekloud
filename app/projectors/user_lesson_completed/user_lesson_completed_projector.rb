module UserLessonCompleted
  class UserLessonCompletedProjector < Sequent::Projector
    manages_tables UserLessonCompletedRecord

    on Events::UserLessonCompletedAdded do |event|
      create_record(UserLessonCompletedRecord, aggregate_id: event.aggregate_id)
    end

    on Events::UserLessonCompletedAllValuesChanged do |event|
      update_all_records(UserLessonCompletedRecord,
                        { aggregate_id: event.aggregate_id },
                        event.attributes.slice(:user_id, :course_id, :lesson_id, :completed))
    end

    # on Events::UserLessonCompletedDestroyed do |event|
    #   delete_all_records(UserLessonCompletedRecord, event.attributes.slice(:aggregate_id))
    # end
  end
end