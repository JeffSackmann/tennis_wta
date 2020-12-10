library(igraph)

strongly_connected <- function(w){
  
  adj <- w
  adj[which(adj != 0)] <- 1
  g <- graph_from_adjacency_matrix(adj,mode="directed")
  temp <- components(g,mode = "strong")
  if(temp$no == 1){
    cat("The graph is strongly connected")
  }
  else cat('The graph contains',temp$no,'strongly connected components')
  
  }

plot_comparisons <- function(w){
  
  adj <- w
  adj[which(adj != 0)] <- 1
  g <- graph_from_adjacency_matrix(adj,mode="directed")
  tkplot(g)
  
}