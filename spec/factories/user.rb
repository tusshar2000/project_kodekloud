FactoryBot.define do
  factory :user do
    email { 'student_test@test.com' }
    password { 'Student@123' }
    role { 'student' }
    username { 'stud' }
  end
end