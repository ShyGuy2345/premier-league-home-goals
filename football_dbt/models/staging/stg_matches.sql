-- Cleans the raw Premier League CSV: renames columns and fixes data types
select
    strptime(Date, '%d/%m/%Y')::date as match_date,
    HomeTeam                         as home_team,
    AwayTeam                         as away_team,
    cast(FTHG as integer)            as home_goals,
    cast(FTAG as integer)            as away_goals,
    FTR                              as result
from read_csv_auto('E0.csv', all_varchar = true)
