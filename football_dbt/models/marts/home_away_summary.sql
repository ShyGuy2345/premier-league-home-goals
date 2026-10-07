-- Goals and points for each team, split by home and away
select
    team,
    venue,
    count(*)           as matches,
    sum(goals_for)     as goals_for,
    sum(goals_against) as goals_against,
    sum(points)        as points
from {{ ref('team_matches') }}
group by team, venue
order by team, venue
