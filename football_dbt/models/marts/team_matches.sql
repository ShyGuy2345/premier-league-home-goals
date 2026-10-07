-- One row per team per match, from that team's point of view
select
    match_date,
    home_team as team,
    away_team as opponent,
    'home'    as venue,
    home_goals as goals_for,
    away_goals as goals_against,
    case result when 'H' then 3 when 'D' then 1 else 0 end as points
from {{ ref('stg_matches') }}

union all

select
    match_date,
    away_team as team,
    home_team as opponent,
    'away'    as venue,
    away_goals as goals_for,
    home_goals as goals_against,
    case result when 'A' then 3 when 'D' then 1 else 0 end as points
from {{ ref('stg_matches') }}
