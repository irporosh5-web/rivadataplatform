create table if not exists rivadataplatform.dataproducts.dim_batch(
    batch_key	BIGINT	Not Null,
    batch_id	STRING	Not Null,
    batch_name	STRING	Not Null,
    start_date	DATE	Not Null,
    end_date	DATE,
    status	STRING	Not Null,
    created_at	TIMESTAMP	Not Null,
    constraint pk_dim_batch primary key (batch_key)
);

--Inserting Data
insert into rivadataplatform.dataproducts.dim_batch(
    batch_key,
    batch_id,
    batch_name,
    start_date,
    end_date,
    status,
    created_at
)

select
CAST(ROW_NUMBER() OVER (ORDER BY batch_id) As Bigint) as batch_key,
cast (batch_id as String) as batch_id,
cast (batch_name as String) as batch_name,
cast (start_date as Date) as start_date,
cast (end_date as Date) as end_date,
cast (status as String) as status,
cast(created_at as Timestamp) as created_at
from rivadataplatform.landing.batches
;