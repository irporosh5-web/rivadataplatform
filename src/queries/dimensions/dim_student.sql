--creating Table
CREATE TABLE IF NOT EXISTS rivadataplatform.dataproducts.dim_student 
(
student_key	BIGINT	Not null,
student_id	STRING	Not null,
student_name	STRING	Not null,
email	STRING	Not null,
city	STRING,
country	STRING,
phone_no	STRING,
linkedin_link	STRING,
github_link	STRING,
created_at	TIMESTAMP	Not null,
CONSTRAINT pk_dim_student PRIMARY KEY (student_key)
);

INSERT INTO rivadataplatform.dataproducts.dim_student
(
    student_key,
    student_id,
    student_name,
    email,
    city,
    country,
    phone_no,
    linkedin_link,
    github_link,
    created_at
)
SELECT
    ROW_NUMBER() OVER (ORDER BY CAST(student_id AS BIGINT)) AS student_key,
    student_id,
    name AS student_name,
    email,
    city,
    country,
    phone_no,
    linkedin_link,
    github_link,
    CAST(created_at AS TIMESTAMP) AS created_at
FROM rivadataplatform.landing.students;
