CREATE TABLE course_records%SUFFIX% (
    id serial NOT NULL,
    aggregate_id uuid NOT NULL,
    title character varying,
    description character varying,
    instructor_id INT,
    CONSTRAINT course_records_pkey%SUFFIX% PRIMARY KEY (id)
);

CREATE UNIQUE INDEX course_records_keys%SUFFIX% ON course_records%SUFFIX% USING btree (aggregate_id);
    