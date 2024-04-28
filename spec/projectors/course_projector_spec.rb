require 'rails_helper'

describe Course::CourseProjector do
  let(:aggregate_id) { Sequent.new_uuid }
  let(:course_projector) { Course::CourseProjector.new }
  let(:course_added) { Course::Events::CourseAdded.new(aggregate_id: aggregate_id, sequence_number: 1) }

  context Course::Events::CourseAdded do
    it 'creates a projection' do
      course_projector.handle_message(post_acourse_addeddded)
      expect(CourseRecord.count).to eq(1)
      record = CourseRecord.first
      expect(record.aggregate_id).to eq(aggregate_id)
    end
  end

  context Course::Events::CourseTitleChanged do
    let(:course_title_changed) do
      Course::Events::CourseTitleChanged.new(aggregate_id: aggregate_id, title: 'title change', sequence_number: 2)
    end

    before { course_projector.handle_message(course_added) }

    it 'updates a projection' do
      Course_projector.handle_message(course_title_changed)
      expect(CourseRecord.count).to eq(1)
      record = CourseRecord.first
      expect(record.title).to eq('title change')
    end
  end
end