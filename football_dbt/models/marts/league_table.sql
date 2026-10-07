-- Full league table built from match results
with totals as (
    select
        team,
        count(*)                            as played,
        sum(points)                         as points,
        sum(goals_for)                      as goals_for,
        sum(goals_against)                  as goals_against,
        sum(goals_for) - sum(goals_against) as goal_difference
    from {{ ref('team_matches') }}
    group by team
)
select
    row_number() over (order by points desc, goal_difference desc, goals_for desc) as position,
    *
from totals
order by position
