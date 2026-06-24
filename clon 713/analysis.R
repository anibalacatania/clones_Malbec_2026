library(SensoMineR)
library(readxl)
library(missMDA)
library(lmerTest)
library(predictmeans)
library(tidyverse)

# wrangling data

data<- datos#import data
data$sesion<-as.factor (data$sesion)
data$producto<-as.factor(data$producto)
data$panelista<-as.factor(data$panelista)


data<-as.data.frame(data)
table<-table(data$producto,data$panelista)
data<-data%>%
  separate(producto, c("Producto", "Rep"))


data<-data %>% select(Producto  ,
Rep   ,
Valuador  ,          
`Fruta fresca`,presistencia


)





plot<- panellipse(data,col.p=1,col.j=3,firstvar=4, level.search.desc =1,graph.type = "ggplot")

plot$graph$plotIndEll+
  theme(aspect.ratio = 1) +labs(title="")+
  theme(axis.title.y = element_text(hjust = 0.5))+
  theme(axis.title.x = element_text(hjust = 0.5))+

  stat_ellipse(type = "t")

plot$graph$plotVarVariab+ theme(legend.position = "none")+
  labs(title="")+
  theme(axis.title.y = element_text(hjust = 0.5))+
  theme(axis.title.x = element_text(hjust = 0.5))












# ##### producto

 res.panelperf <- panelperf(data,firstvar=5,formul="~Producto+panelista+sesion+panelista:Producto+panelista:sesion+Producto:sesion",random=T)
 coltable(res.panelperf$p.value[order(res.panelperf$p.value[,1]),],col.lower="gray", level.lower = 0.05,cex=0.8)


 #poder de Discrimination
 str(data)
 res.paneliperf <- paneliperf(data,formul="~Producto+panelista+ sesion+Producto:panelista+Producto:sesion+panelista:sesion", formul.j="~Producto+sesion",col.j=3,firstvar=5,synthesis=TRUE)
 names(res.paneliperf)
 res.magicsort <- magicsort(res.paneliperf$prob.ind,method="median")
 round(res.magicsort,3)
 coltable(round(res.magicsort,2),level.lower=0.05,level.upper=0.06, col.lower="gainsboro",col.upper="gray",cex = 0.5, nbcol=16)
 write.table(round(res.magicsort,3),"poderdiscri.csv",row.names = TRUE)
 #Acuerdo de los panelistas
 res.paneliperf <- paneliperf(data,formul="~Producto+panelista+ sesion+Producto:panelista+Producto:sesion+panelista:sesion", formul.j="~Producto+sesion",col.j=3,firstvar=5,synthesis=TRUE)
 names(res.paneliperf)
 res.magicsort <- magicsort(res.paneliperf$agree.ind,method="median")
 round(res.magicsort,3)
 coltable(round(res.magicsort,2),level.lower=-0.001,level.upper=0.80, col.lower="gainsboro",col.upper="gray",cex = 0.5,nbcol=16)
 write.table(round(res.magicsort,3),"poderdiscri.csv",row.names = TRUE)
 
 #Repetibilidad
 res.paneliperf <- paneliperf(data,formul="~Producto+panelista+ sesion+Producto:panelista+Producto:sesion+panelista:sesion", formul.j="~Producto+sesion",col.j=3,firstvar=5,synthesis=TRUE)
 names(res.paneliperf)
 res.magicsort <- magicsort(res.paneliperf$res.ind,method="median")
 round(res.magicsort,3)
 coltable(round(res.magicsort,2),level.lower=0.001,level.upper=1.96, col.lower="gainsboro",col.upper="gray",cex = 0.5,nbcol=16)

 
library(agricolae)
aov <- aov(data$Durazno ~ Producto+panelista+ sesion+Producto:panelista+Producto:sesion+panelista:sesion, data = data)
lsd <- LSD.test(aov, "Producto", p.adj = "bonferroni", alpha=0.1)
bar.group(lsd$groups, col="blue", border = "blue", density=30,cex.names = 0.6, ylim=c(0,3))

