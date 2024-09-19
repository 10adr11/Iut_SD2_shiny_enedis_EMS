logements_existatnts <- read.csv("L:/BUT/SD/Promo 2023/agiurgiu/SD 2/Projet R/dpe-v2-logements-existants.csv", header = TRUE, sep = ",", dec = ".")
logements_neuf <- read.csv("L:/BUT/SD/Promo 2023/agiurgiu/SD 2/Projet R/dpe-v2-logements-neufs.csv", header = TRUE, sep = ",", dec = ".")

dim(logements_existatnts)
dim(logements_neuf)

logements_existatnts$logement = "ancien"
logements_neuf$logement = "neuf"

col_com = intersect(names(logements_existatnts),names(logements_neuf))
loge_ex2 = logements_existatnts[,col_com]
loge_neuf2 = logements_neuf [,col_com]
tous_log = rbind(loge_neuf2 , loge_neuf2)

tous_log$Année=substr(tous_log$Date_réception_DPE,0,4) 



for (i in 1:nrow(tous_log)){
  if(tous_log$Coût_total_5_usages[i] == tous_log$Coût_chauffage[i] + tous_log$Coût_éclairage[i] + tous_log$Coût_ECS[i] + tous_log$Coût_refroidissement[i] + tous_log$Coût_auxiliaires[i]){
    tous_log$Vérif[i] <- "OK"
  }else{
    tous_log$Vérif[i] <- "Pas OK"
  }
  if(tous_log$Coût_total_5_usages[i] != 0){
    tous_log$Coût_chauffage_pourcent[i] <- (tous_log$Coût_chauffage[i] / tous_log$Coût_total_5_usages[i]) * 100
  } else {
    tous_log$Coût_chauffage_pourcent[i] <- NA
  }
}

table(tous_log$Etiquette_DPE)
table(tous_log$Année)


histogramme <- hist(tous_log$Surface_habitable_logement, breaks = 100)


carthographie <- read.csv("L:/BUT/SD/Promo 2023/agiurgiu/SD 2/Projet R/adresses-69.csv", header = TRUE, sep = ";", dec = ".")

merg

