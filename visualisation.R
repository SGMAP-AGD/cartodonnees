# https://briatte.github.io/ggnet/
#https://bl.ocks.org/mbostock/4063550

library(GGally)
library(network)
library(sna)
library(ggplot2)

net = rgraph(10, mode = "graph", tprob = 0.5)
net = network(net, directed = FALSE)
network.vertex.names(net) = letters[1:10]

ggnet2(net)

?rgraph
