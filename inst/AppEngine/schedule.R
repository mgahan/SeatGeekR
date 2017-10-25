# roxygen2::roxygenise() # Update package documentation
# sudo R CMD INSTALL --no-multiarch --with-keep.source ~/SeatGeekR

# Bring in library
library(SeatGeekR)

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
  
  #seatgeek_extract_slug(TEAM_NAME="nebraska-cornhuskers-football")
  #seatgeek_extract_slug(TEAM_NAME="army-west-point-black-knights-football")
  
  return(TotalTime)
}


#gcloud app deploy
#gcloud app deploy cron.yaml
# curl "https://seatgeek-dot-metabiota-modeling.appspot.com/seatgeek"