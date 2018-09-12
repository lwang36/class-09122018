library(affy)

setwd("C:/Users/Ling/Desktop/estrogen")

targetsFile <- "estrogen.txt"

pd <- read.AnnotatedDataFrame(targetsFile,header=TRUE,sep="",row.names=1)

pData(pd)

ER <- pData(pd)$estrogen

Time <- factor(pData(pd)$time.h)

design <- model.matrix(~ER+Time)

design



design2 <- model.matrix(~ER*Time)

design2



raw <-ReadAffy(celfile.path = "C:/Users/Ling/Desktop/estrogen", filenames=rownames(pData(pd)),phenoData = pd)

raw



boxplot(raw,col="red",las=2)

bad <-ReadAffy(celfile.path = "C:/Users/Ling/Desktop/estrogen",filenames="bad.cel")

image(bad)

x11()
image(raw)

# Perform an RNA normalization and put the output into an object called eset on raw data.

eset <- rma(raw)

# PM: Perfect Match probe
  MM: Mismatch probe

par(mfrow=c(2,1))
hist(log2(pm(raw[,1])), breaks=100, col="steelblue", main="PM", xlim=c(4,14))
hist(log2(mm(raw[,1])), breaks=100, col="steelblue", main="MM", xlim=c(4,14))

par(mfrow=c(2,1))
hist(log2(pm(raw[,2])), breaks=100, col="steelblue", main="PM", xlim=c(4,14))
hist(log2(mm(raw[,2])), breaks=100, col="steelblue", main="MM", xlim=c(4,14))

# Annotation of samples
source("https://bioconductor.org/biocLite.R")
biocLite("GEOquery")
library(GEOquery)

url <- "https://ftp.ncbi.nih.gov/geo/series/GSE33nnn/GSE33126/matrix/"
filenm <- "GSE33126_series_matrix.txt.gz"
if(!file.exists(filenm)) download.file(url, destfile=filenm)
qse <- getGEO(filename=filenm)

# how to download a file from FTP server in a linux computer








