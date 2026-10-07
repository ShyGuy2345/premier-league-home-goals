-- A full Premier League season has 380 matches. This test fails if the count differs.
select count(*) as match_count
from {{ ref('stg_matches') }}
having count(*) != 380
