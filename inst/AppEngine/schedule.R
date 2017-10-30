# roxygen2::roxygenise() # Update package documentation
# sudo R CMD INSTALL --no-multiarch --with-keep.source ~/SeatGeekR

# Bring in library
library(SeatGeekR)
library(googleAuthR)         
library(googleCloudStorageR) 

#* @get /seatgeek
scheduleSeatGeek <- function() {
  
  # Extract TeamNames data
  fpath <- system.file("Teams", "Team_Slug_Names.csv", package="SeatGeekR")
  TeamNames <- fread(fpath)
  
  # Loop over teamnames
  StartTime <- Sys.time()
  datList <- lapply(TeamNames$Team, function(x) {print(x);seatgeek_extract_slug(TEAM_NAME=x)})
  dat <- rbindlist(datList, fill=TRUE)
  EndTime <- Sys.time()
  TotalTime <- as.character(EndTime-StartTime)
  
   # Write out file
  FileName <- Sys.time()
  FileName <- paste0(gsub("\\s+","",gsub("[[:punct:]]","",FileName)),".csv")
  fwrite(dat, file = FileName)
  ZipTxt <- paste0("gzip ",FileName)
  ZipSys <- system(ZipTxt, intern=TRUE)
  
  # Upload file
  #system(paste0("gsutil -q -m mv ",FileName,".gz gs://metabiota-tweets/Historical/",FileName,".gz"))
  gcs_upload(paste0(FileName,".gz"), 
             bucket = "seatgeek-scrape", 
             name = paste0("",FileName,".gz"))
  RmvFile <- file.remove(paste0(FileName,".gz"))
  
  #seatgeek_extract_slug(TEAM_NAME="nebraska-cornhuskers-football")
  #seatgeek_extract_slug(TEAM_NAME="army-west-point-black-knights-football")
  
  # Return sample
  sampDat <- dat[TEAM_NAME=="nebraska-cornhuskers-football"]
  sampJSON <- jsonlite::toJSON(sampDat)
  outList <- list(SampleData=sampJSON)
  
  return(outList[])
}


#gcloud app deploy
#gcloud app deploy cron.yaml
# curl "https://seatgeek-dot-metabiota-modeling.appspot.com/seatgeek"