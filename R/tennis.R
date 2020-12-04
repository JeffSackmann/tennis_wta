setwd("~/PhD/First Year/Statistical Computing/tennis_wta")

x <- list.files("tennis_wta/")
thing <- as.matrix(read.delim("thing.txt", header=FALSE))

thing_list <- vector("list")

for (count in 1:length(thing)) {
  thing_list[[i]] <- read.csv(thing[count])
}
read.csv()