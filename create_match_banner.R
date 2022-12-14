
library(imager)

setwd("/home/alfonso/Documents/GoogleDrive/world_cup")
matches <- read.csv("matches.csv")
setwd("flags/")
for (i in 1:nrow(matches)){



flags <- dir(pattern = "*png")

match <- stringr::str_pad(as.character(i),
                          width = 2,
                          pad = "0",
                          side = "left")

output<- paste("matches/",
               "Match",match,".png",sep = "")

local <- matches[i,2]
visitor <- matches[i,3]
x <- imager::load.image(paste(local,".png",sep=''))
y <- load.image(paste(visitor,".png",sep=''))

png(filename = output,
   height = 350,width = 800,res = 170,units = "px")

par(mar = c(0.5,0.5,2,0.5),mfrow = c(1,2),
    bg = "gray97")
plot(x,axes = F,main = local,
     cex.main = 30)
plot(y,axes = F,main = visitor)
dev.off()
rm(i)
}
