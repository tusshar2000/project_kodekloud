# Staff Scheduler
## Requirement
    rvm or rbenv to install ruby-3.1.2
    postgresql installed
## Running
    bundle install
    rails db:create
    rails migrate_public_schema
    bundle exec rake sequent:db:create_event_store
    bundle exec rake sequent:db:create_view_schema
    bundle exec rake sequent:migrate:online
    bundle exec rake sequent:migrate:offline
    rails s
## Endpoints
- POST http://127.0.0.1:1337/users
    -   This will create users
    -   To create user of type student
        -   Payload: {
                "user": {
                    "email": "stud@d.com",
                    "password": "stud",
                    "username": "stud",
                    "role": "student"
                }
            }
    -   To create user of type instructor
        -   payload: {
                "user": {
                    "email": "inst@d.com",
                    "password": "inst",
                    "username": "inst",
                    "role": "instructor"
                }
            }
    - Response:
        - statuscode: 200
            -   {
                    "id": 1,
                    "message": "User Created Successfully"
                } 
        - statuscode: 422, 
            -   appropriate error message is shown

-   POST http://127.0.0.1:1337/auth/login
    -   This will login user and will give auth jwt token
    -   Payload:
        -   {
                "email": "stud@d.com",
                "password": "stud"
            }
    -   Response:
        -   statuscode: 202
            -   {
                    "message": "Login Successful",
                    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3MTQzOTEzMjJ9.LBuEdDzn6NUQF2O2bufKwdc54CzETxFyO-kRJzZYQ_Y"
                }
        -   statuscode: 401
            -   appropriate error message is shown

-   POST http://127.0.0.1:1337/course/create_course
    -   This will create a course, only user with role instructor can create a course
    -   Payload:
        -   {
                "course": {
                    "title": "Course 1",
                    "description": "Course 1 description"
                }
            }
    -   Response:
        -   statuscode: 201
            -   {
                    "message": "Course Created Successfully"
                }
        -   statuscode: 401
            -   appropriate error message is shown

-   POST http://127.0.0.1:1337/lesson/create_lesson
    -   This will create a lesson in a course, only user with role instructor can create a lesson
    -   Payload:
        -   {
                "lesson": {
                    "title": "lesson 1 course 1",
                    "content": "content lesson 1",
                    "course_id": "2"
                }
            }
    -   Response:
        -   statuscode: 201
            -   {
                    "message": "Lesson Created Successfully"
                }
        -   statuscode: 401, 404
            -   appropriate error message is shown

-   POST http://127.0.0.1:1337/enroll_course
    -   student can enroll in a course with this API, instructor cannot access this API
    -   Payload:
        -   {
                "course_id": 1
            }
    -   Response:
        -   statuscode: 201
            -   {
                    "message": "Enrolled Successfully"
                }
        -   statuscode: 401, 400, 404
            -   appropriate error message is shown

DELETE http://127.0.0.1:1337/unenroll_course/:course_id
    -   student can unenroll in a course with this API, instructor cannot access this API
    -   Response:
        -   statuscode: 201
            -   {
                    "message": "Unenrolled Successfully"
                }
        -   statuscode: 401, 400
            -   appropriate error message is shown

            
POST http://127.0.0.1:1337/lesson_completed
    -   To mark a particular lesson completed from a course a student is enrolled to
    -   Payload
        -    {
                "course_id": 1,
                "lesson_id": 1
            }
    -   Response:
        -   statuscode: 201
            -   {
                    "message": "Lesson Completed"
                }
        -   statuscode: 401, 400
            -   appropriate error message is shown

GET http://127.0.0.1:1337/user_course_details
    -   get student's course completion details
    -   Response:
        -   statuscode: 200
            -   [
                    {
                        "course_id": 1,
                        "completion_percentage": 100.0
                    }
                ]
        -   statuscode: 401
            -   appropriate error message is shown   
      
## Features
-   Authentication has been done using JWT.
-   Authorization has been handled with cancancan gem.
-   Port 1337 accepts the API requests.

## Model
- User
    - has username, email, password and role
    - has two distinct roles: student and instructor
- CourseRecord
    - has title, description, instructor_id
    - maintains list of courses belonging to an instructor
- LessonRecord
    - has course_id, title, content
    - maintains list of lessons belonging to a course
- UserCourseRecord
    - has user_id, course_id
    - maintains list of courses a student is enrolled to
- UserLessonCompletedRecord
    - has course_id, user_id, lesson_id, completed
    - maintains which lessons of an enrolled course are completed by a student

## Troubleshooting
-   Ensure sequent dependencies are fulfilled