## WTA Tennis Rankings, Results, and Stats

This repo contains my master WTA player file, historical rankings, and an extensive database of match results.

The player file columns are: player_id, first_name, last_name, hand, birth_date, country_code.

The columns for the ranking files are: ranking_date, ranking, player_id, ranking_points, tours. 'Tours' is WTA jargon for certain types of tournaments played, and that column is not anywhere near complete.

Match result files (e.g. 'wta_matches_2014.csv') contain all tour-level singles matches for that season. To make them easier to use, I've included a fair bit of redundancy with the biographical and ranking files: each row contains several columns of biographical information, along with ranking and ranking points, for both players. Ranking data, as well as age, are as of tourney_date, which is almost always the Monday at or near the beginning of the event.

ITF and tour-level qualifying match results are stored in a separate yearly file (e.g. 'wta_matches_qual_itf_2014.csv').

These files are in the same format as my ATP player, rankings, and results databases (https://github.com/JeffSackmann/tennis_atp). There's a small amount of sample code available there (https://github.com/JeffSackmann/tennis_atp/tree/master/examples).

(update, 6 sept) Some match stats are now included! They are mostly complete for tour-level matches back to 2006; there are some for tour-level matches before that, and there are stats for many qualifying matches from the last few years. These might not be kept quite as current as the match results for the remainder of 2015.
