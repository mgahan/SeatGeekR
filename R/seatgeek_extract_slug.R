#' Extract data from SeatGeek API
#'
#' Extract ticket prices, ticket counts
#' @keywords stubhub
#' @param TEAM_NAME teamname "nebraska-cornhuskers-football"
#' @param SEATGEEK_CLIENT_ID Defaults to Sys.getenv("SEATGEEK_CLIENT_ID")
#' @param SEATGEEK_CLIENT_SECRET VDefaults to Sys.getenv("SEAKGEEK_CLIENT_SECRET")
#' @export
#' @examples
#' fpath <- system.file("Teams", "Team_Slug_Names.csv", package="SeatGeekR")
#' TeamNames <- fread(fpath)
#' seatgeek_extract_slug(TEAM_NAME="nebraska-cornhuskers-football")

seatgeek_extract_slug <- function(TEAM_NAME, SEATGEEK_CLIENT_ID=Sys.getenv("SEATGEEK_CLIENT_ID"),
                                 SEATGEEK_CLIENT_SECRET=Sys.getenv("SEATGEEK_CLIENT_SECRET")) {

  # Extract Data from Seatgeek API
  url <- paste0("https://api.seatgeek.com/2/events?performers.slug=",TEAM_NAME,"&client_id=",
               SEATGEEK_CLIENT_ID,"&client_secret=",SEATGEEK_CLIENT_SECRET)
  output <- GET(url=url)

  # Search if output returned an error or not
  if (http_error(output)) {
      errorCode <- status_code(output)
      ErrorMessage <- paste0("Query returned error code ",errorCode)
      print(ErrorMessage)
      dat <- data.table(TEAM_NAME=TEAM_NAME, STATUS_CODE=status_code(output))
  } else {
      # If no error, parse output
      parsed <- jsonlite::fromJSON(content(output, "text", encoding = "UTF-8"), simplifyVector = FALSE)
      
      # Check number of events
      NumEvents <- parsed$meta$total
      if (NumEvents > 0) {
        # Convert output from JSON
        jsonToDT <- function(x) {
          tmp1 <- unlist(parsed$events[[x]])
          tmp2 <- data.table(Variable=names(tmp1), Value=tmp1)
          tmp2[, ID := x]
          return(tmp2)
        }
  
        # Extract JSON parts
        datOut <- rbindlist(lapply(1:length(parsed$events), jsonToDT), fill=TRUE)
        datOutConsol <- datOut[Variable %like% "stats" | Variable=="datetime_local" | Variable=="title" | Variable=="popularity" |
            Variable=="venue.display_location" | Variable=="venue.name" | Variable %like% "score" | Variable=="id"]
        datOutConsol[, Count := .N, by=.(ID, Variable)]
        datOutConsol[Count > 1, RowOrd := 1:.N, by=.(ID, Variable)]
        datOutConsol[RowOrd==2, Variable := paste0(Variable,".opponent")]
        datOutConsol[, TEAM_NAME := TEAM_NAME]
        dat <- dcast(datOutConsol, TEAM_NAME+ID~Variable, value.var="Value",fun.aggregate = function(x) unique(x)[1])
        dat[, STATUS_CODE := status_code(output)]
      } else {
        dat <- data.table(TEAM_NAME=TEAM_NAME, STATUS_CODE=paste0(status_code(output)," - # of events is ",NumEvents))
      }

  }

  # Return data
  return(dat[])
}

