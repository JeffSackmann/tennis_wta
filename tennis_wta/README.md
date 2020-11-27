## WTA Tennis Rankings, Results, and Stats

This repo contains my master WTA player file, historical rankings, and an extensive database of match results.

The player file columns are: player_id, first_name, last_name, hand, birth_date, country_code.

The columns for the ranking files are: ranking_date, ranking, player_id, ranking_points, tours. 'Tours' is WTA jargon for certain types of tournaments played, and that column is not anywhere near complete. 

Match result files (e.g. 'wta_matches_2014.csv') contain all tour-level singles matches for that season. To make them easier to use, I've included a fair bit of redundancy with the biographical and ranking files: each row contains several columns of biographical information, along with ranking and ranking points, for both players.

ITF, tour-level qualifying, and some ITF-level qualifying match results are stored in a separate yearly file (e.g. 'wta_matches_qual_itf_2014.csv').

Most of the columns in the results files are self-explanatory. For more details, see the matches_data_dictionary.txt file in the parallel tennis_atp repo.

These files are in the same format as my ATP player, rankings, and results databases (https://github.com/JeffSackmann/tennis_atp). There's a small amount of sample code available there (https://github.com/JeffSackmann/tennis_atp/tree/master/examples).

# License

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Dataset" property="dct:title" rel="dct:type">Tennis databases, files, and algorithms</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://www.tennisabstract.com/" property="cc:attributionName" rel="cc:attributionURL">Jeff Sackmann / Tennis Abstract</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.<br />Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="https://github.com/JeffSackmann" rel="dct:source">https://github.com/JeffSackmann</a>.

In other words: Attribution is required. Non-commercial use only.
