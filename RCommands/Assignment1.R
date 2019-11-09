id=read.table(file = 'D:/Study/ECE720 S2/720 Assignment1/data/asker-answerer_matrix.tsv',  header = TRUE)

library(igraph)
library(sna)
library(CINNA)
set.seed(10)
id_matrix=as.matrix(id)

#plot asker-answerer graph
gplot(id_matrix)



#find giant component
g=graph.adjacency(id_matrix)
giant_component=giant_component_extract(g,directed = TRUE, bipartite_proj = FALSE, num_proj = 1)
write.table(giant_component[2],file='D:/Study/ECE720 S2/720 Assignment1/data/asker-answerer_giant.tsv', sep="\t",row.names = FALSE, col.names = FALSE)
write.table(giant_component[2],file='D:/Study/ECE720 S2/720 Assignment1/data/giant_component.csv', sep=" ",row.names = FALSE, col.names = FALSE)

#plot giant component graph
comp=read.table(file = 'D:/Study/ECE720 S2/720 Assignment1/data/giant_component_matrix.tsv',  header = TRUE)
comp=as.matrix(comp)
gplot(comp)
