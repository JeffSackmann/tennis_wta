

# # check for missing surface types
count_clay <- 0
count_grass <- 0
count_carpet <- 0
count_hard <- 0
count_weird <- 0
counter <- 0
indexing <- rep(0, 593)




break_surfaces <- function(data, list_types) {
  
  counts <- t(rep(0, length(list_types)+1))
  counts <- as.data.frame(counts)
  colnames(counts) <- c(list_types, "Other")
  other_indexes <- 0
  
  for (i in 1:dim(data)[1]) {
    flag = FALSE
    for (j in 1:length(list_types)) {
      if(data$surface[i]==list_types[j]) {
        print("hi")
        flag = TRUE
        counts$list_types[j] = counts$list_types[j] + 1
      }
    }
    if (flag == FALSE) {
      counts$Other <- counts$Other + 1 
      other_indexes[counts$Other] <- i
    }
  }
  return(list(counts, other_indexes))
}

for (i in 1:length(melted_files$surface)) {
  if (melted_files$surface[i]=="Clay") {
    count_clay <- count_clay + 1
  } else if (melted_files$surface[i]=="Grass") {
    count_grass <- count_grass + 1
  } else if (melted_files$surface[i]=="Carpet") {
    count_carpet <- count_carpet + 1
  } else if (melted_files$surface[i]=="Hard") {
    count_hard <- count_hard + 1
  } else {
    counter <- counter+1
    indexing[counter] <- i
    count_weird <- count_weird+1
  }
}


surfaces <- unique(melted_files[-indexing,]$surface)
no_surfaces <- length(unique(surfaces))


counts <- t(rep(0, length(list_types)+1))
counts <- as.data.frame(counts)
colnames(counts) <- c(list_types, "Other")
for (surf in list_types) {
  
}



surfaces_data <- function(data, list_types){
  new_data <- data[which(data$surface == list_types[1]),]
  for (i in 2:length(list_types)){
    new_data <- rbind(new_data, data[which(data$surface == list_types[i]),])
  }
  new_data
  return(new_data)
}
x <- surfaces_data(data,list_types)







