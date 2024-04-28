CREATE TABLE lesson_records%SUFFIX% (
    id serial NOT NULL,
    aggregate_id uuid NOT NULL,
    course_id INT,
    title character varying,
    content character varying,
    FOREIGN KEY (course_id) REFERENCES course_records(id) ON DELETE CASCADE,
    CONSTRAINT lesson_records_pkey%SUFFIX% PRIMARY KEY (id)
);

CREATE UNIQUE INDEX lesson_records_keys%SUFFIX% ON lesson_records%SUFFIX% USING btree (aggregate_id);
