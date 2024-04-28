Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/users', to: 'users#create'
  get '/me', to: 'users#me'
  post '/auth/login', to: 'auth#login'
  post 'course/create_course', to: 'course#create_course'
  post 'lesson/create_lesson', to: 'lesson#create_lesson'
  post 'enroll_course', to: 'user_course#enroll_course'
  delete 'unenroll_course/:course_id', to: 'user_course#unenroll_course'
  post 'lesson_completed', to: 'user_lesson_completed#lesson_completed'
  get 'user_course_details', to: 'users#user_course_details'
end
