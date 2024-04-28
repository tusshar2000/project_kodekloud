require 'rails_helper'

describe CourseCommandHandler do
  before :each do
    Sequent.configuration.command_handlers = [CourseCommandHandler.new]
  end

  context AddCourse do
    it 'creates a user when valid input'
    it 'fails if the username already exists'
    it 'ignores case in usernames'
  end
end