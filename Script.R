
###### Written by : Idrissa Dieng
## Date : 15 June 2021
###### Script for removing bootstrap value less then a defined cut-off:


#install.packages("ape") # Install ape package if you don't have it already
library(ape) # Load the ape package
#setwd("/Users/macbookpro/Desktop/R_bash/") # Put here the directory where your tree is
tree <- read.tree("1.contree") # A normal Newick with bootstraps from Iqtree or Raxml, for example
tree$node.label # Show the bootstrap values from the phylo object
tree$node.label <- ifelse(tree$node.label <= 70,"",tree$node.label) ## Specify the cut of you want ex here greater than 70
write.tree(tree, file = "MyNewTree.nwk") # Save it


