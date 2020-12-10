setwd("~/Documents/PhD/First Year/Statistical Computing/tennis_wta/tennis_wta/rel_files")


file_list = list.files(pattern="*.csv")
no_files <- length(file_list)
test_file <- file_list[[no_files]]
file_list <- file_list[1:(no_files-1)]


#read all files and melt into one long table with only relevant information
for (file_index in 1:(no_files-1)) {
  temp_file <- read.csv(file_list[[file_index]])
  reduced_file <- subset(temp_file, select = c(surface, winner_id, loser_id))
  if (file_index==1) {
    melted_files <- reduced_file
  } else {
    melted_files <- rbind(melted_files, reduced_file)
  }
}

#load the test file
reduced_test_file <- subset(read.csv(test_file), select = c(surface, winner_id, loser_id))



#break the data up into the different surfaces
surfs <- c("Grass", "Clay", "Hard", "Carpet")
no_surfs <- length(surfs)
broken_data <- vector("list", no_surfs)
for (i in 1:no_surfs) {
  broken_data[[i]] <- melted_files[which(melted_files$surface == surfs[i]),]
}

#find the players
players <- unique(c(melted_files$winner_id, melted_files$loser_id))
no_players <- length(players)

#initialise the variables
w <- array(0, c(no_players, no_players, no_surfs))
n <- array(0, c(no_players, no_players, no_surfs))
row.names(w) <- players
colnames(w) <- row.names(w)

#function to fill in w matrix
w_fill <- function(data_mat, players) {
  no_players <- length(players)
  w <- matrix(0, no_players, no_players)
  for (i in 1:no_players) {
    player <- players[i]
    win_ind <- which(row.names(w)==player)
    los_ids <- data_mat$loser_id[which(data_mat$winner_id==player)]
    for (j in 1:length(los_ids)) {
      loser <- los_ids[j]
      los_ind <- which(players==loser)
      w[win_ind, los_ind] <- w[win_ind, los_ind] + 1
    }
  }
  return(w)
}

#fill in the matrices
for (j in 1:no_surfs) {
  w[,,j] <- w_fill(broken_data[[j]], players)
  n[,,j] <- w[,,j] + t(w[,,j])
}

# #fill in the matrices
# for (j in 1:no_surfs) {
#   for (i in 1:no_players) {
#     player <- players[i]
#     win_ind <- which(row.names(w)==player)
#     los_ids <- melted_files$loser_id[which(melted_files$winner_id==player)]
#     for (j in 1:length(los_ids)) {
#       loser <- los_ids[j]
#       los_ind <- which(players==loser)
#       w[win_ind, los_ind] <- w[win_ind, los_ind] + 1
#     }
#   }
# }




