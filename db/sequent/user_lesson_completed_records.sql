CREATE TABLE user_lesson_completed_records%SUFFIX% (
    aggregate_id uuid NOT NULL,
    user_id INT,
    course_id INT,
    lesson_id INT,
    completed BOOLEAN
);

CREATE UNIQUE INDEX user_lesson_completed_records_keys%SUFFIX% ON user_lesson_completed_records%SUFFIX% USING btree (aggregate_id);
