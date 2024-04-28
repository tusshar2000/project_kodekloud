CREATE TABLE user_course_records%SUFFIX% (
    aggregate_id uuid NOT NULL,
    user_id INT,
    course_id INT
);

CREATE UNIQUE INDEX user_course_records_keys%SUFFIX% ON user_course_records%SUFFIX% USING btree (aggregate_id);
