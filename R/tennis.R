setwd("~/PhD/First Year/Statistical Computing/tennis_wta/tennis_wta/rel_files")


file_list = list.files(pattern="*.csv")


for (file_index in 1:length(file_list)) {
  temp_file <- read.csv(file_list[[file_index]])
  reduced_file <- subset(temp_file, select = c(surface, winner_id, loser_id))
  if (file_index==1) {
    melted_files <- reduced_file
  } else {
    melted_files <- rbind(melted_files, reduced_file)
  }
}
no_winners <- length(unique(melted_files$winner_id))
no_losers <- length(unique(melted_files$loser_id))
no_players <- max(no_winners, no_losers)



# # check for missing surface types
# count_clay <- 0
# count_grass <- 0
# count_carpet <- 0
# count_hard <- 0
# count_weird <- 0
# counter <- 0
# indexing <- rep(0, 593)
# for (i in 1:length(melted_files$surface)) {
#   if (melted_files$surface[i]=="Clay") {
#     count_clay <- count_clay + 1
#   } else if (melted_files$surface[i]=="Grass") {
#     count_grass <- count_grass + 1
#   } else if (melted_files$surface[i]=="Carpet") {
#     count_carpet <- count_carpet + 1
#   } else if (melted_files$surface[i]=="Hard") {
#     count_hard <- count_hard + 1
#   } else {
#     counter <- counter+1
#     indexing[counter] <- i
#     count_weird <- count_weird+1
#   }
# }


# surfaces <- unique(melted_files[-indexing,]$surface)
# no_surfaces <- length(unique(surfaces))


##new stuff
players <- unique(c(melted_files$winner_id, melted_files$loser_id))
no_players <- length(players)

w <- matrix(0, no_players, no_players)
w <- as.data.frame(w)
row.names(w) <- players
colnames(w) <- row.names(w)

for (i in 1:no_players) {
  player <- players[i]
  win_ind <- which(row.names(w)==player)
  los_ids <- melted_files$loser_id[which(melted_files$winner_id==player)]
  for (j in 1:length(los_ids)) {
    loser <- los_ids[j]
    los_ind <- which(row.names(w)==loser)
    w[win_ind, los_ind] <- w[win_ind, los_ind] + 1
  }
}

n <- w+t(w)
