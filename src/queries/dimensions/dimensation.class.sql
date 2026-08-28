Create table if not exists rivadataplatform.dataproducts.dim_class (
    class_key	BIGINT	Not null,
    class_id	STRING	Not null,
    batch_id	STRING	Not null,
    class_date	DATE	Not null,
    class_day	STRING,	
    topic	    STRING	Not null,
    instructor	STRING	Not null,
    status	    STRING	Not null,
    notes	    STRING,
    constraint pk_dim_class primary key(class_key)      
);

--Inserting Data
INSERT INTO rivadataplatform.dataproducts.dim_class(
    class_key,
    class_id,
    batch_id,
    class_date,
    class_day,
    topic,
    instructor,
    status,
    notes
)

select 
Row_Number() OVER (
    ORDER BY CAST (class_id AS BIGINT)
) AS class_key,
class_id,
batch_id,
Cast (class_date as Date),
class_day,
topic,
instructor,
status,
notes   
from rivadataplatform.dataproducts.dim_class;

