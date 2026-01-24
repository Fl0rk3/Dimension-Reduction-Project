# Dimensionality Reduction of Football Player Attributes Using EA Sports FC 26 Data

library(corrplot)
library(ggplot2)
library(caret)
library(factoextra)
library(gridExtra)

getwd()
player_stats <- read.csv('fc26_data.csv')

summary(player_stats)
dim(player_stats)

player_stats = player_stats[complete.cases(player_stats), ]

summary(player_stats)
dim(player_stats)

data_corr <- cor(player_stats, method="pearson") 
corrplot(data_corr, tl.cex=0.6)

preproc <- preProcess(player_stats, method=c("center", "scale"))
player_stats_s <- predict(preproc, player_stats)
summary(player_stats_s)

player_stats_cov <- cov(player_stats_s)
player_stats_eigen <- eigen(player_stats_cov)
head(player_stats_eigen$vectors)

player_stats_s_pca1 <- prcomp(player_stats_s, center=FALSE, scale.=FALSE)
head(player_stats_s_pca1$rotation)

summary(player_stats_s_pca1)

fviz_pca_var(player_stats_s_pca1, col.var="steelblue")

eigen_plot <- fviz_eig(player_stats_s_pca1, choice='eigenvalue', addlabels=TRUE)
variances_plot <- fviz_eig(player_stats_s_pca1)
grid.arrange(eigen_plot, variances_plot, nrow=2)

eig.val<-get_eigenvalue(player_stats_s_pca1)
eig.val

a<-summary(player_stats_s_pca1)
plot(a$importance[3,],type="l")


PC1 <- fviz_contrib(player_stats_s_pca1, choice = "var", axes = 1, top=10)
PC2 <- fviz_contrib(player_stats_s_pca1, choice = "var", axes = 2, top=10)
PC3 <- fviz_contrib(player_stats_s_pca1, choice = "var", axes = 3, top=10)
PC4 <- fviz_contrib(player_stats_s_pca1, choice = "var", axes = 4, top=10)
grid.arrange(PC1, PC2, PC3, PC4, nrow=4)
