id=read.table(file = 'D:/Study/ECE720 S2/720 Assignment1/data/asker-answerer_matrix.tsv',  header = TRUE)
id_list=read.table(file = 'D:/Study/ECE720 S2/720 Assignment1/data/asker-answerer.tsv',  header = TRUE)
id_loc=read.table(file = 'D:/Study/ECE720 S2/720 Assignment1/data/id_location.tsv',  header = FALSE)
library(igraph)
library(sna)
set.seed(10)
id_matrix=as.matrix(id)

#plot asker-answerer graph
gplot(id_matrix)




#find giant asker-answerer by degree
max(degree(id_matrix))
x=degree(id_matrix)
giant_user_degree=x[order(x,decreasing=TRUE)[1:20]]
giant_user_location=order(x,decreasing=TRUE)[1:20]

id_loc=as.matrix(id_loc)
id_list=as.matrix(id_list)

a={}
d={}
p=1
for (m in 1:length(giant_user_location)){
  b=which(id_list==id_loc[giant_user_location[m],2])
  for (n in 1:length(b)){
    if (b[n]>1245){
      b[n]=b[n]-1245
    }
    else{
      b[n]=b[n]
    }
  }
  for (n in 1:length(b)){
    a[p]=id_list[b[n],1]
    d[p]=id_list[b[n],2]
    p=p+1
  }
}

cells=c(a,d)
giant_component=matrix(cells,length(a),2)
giant_component
write.table(giant_component,file='D:/Study/ECE720 S2/720 Assignment1/data/giant_component.tsv', sep="\t",row.names = FALSE, col.names = FALSE)
write.table(giant_component,file='D:/Study/ECE720 S2/720 Assignment1/data/giant_component.csv', sep=" ",row.names = FALSE, col.names = FALSE)

#plot giant component graph
comp=read.table(file = 'D:/Study/ECE720 S2/720 Assignment1/data/folder/giant_component_matrix.tsv',  header = TRUE)
comp=as.matrix(comp)
gplot(comp)
