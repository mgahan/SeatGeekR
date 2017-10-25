# library(httr)
# library(curl)
# library(data.table)
#
# Teams <- fread("Teams.csv", sep=",")
# Teams[, TeamLower := paste0(tolower(Team)," football")]
# Teams[, TeamCall := gsub(" ","-",TeamLower)]
# Teams <- Teams[, .(Sport="NCAA Football", Team=TeamCall)]
# fwrite(Teams,"Team_Slug_Names.csv")
# fread("Team_Slug_Names.csv")


#   status_code(out)
#   parsed <- jsonlite::fromJSON(content(out, "text", encoding = "UTF-8"), simplifyVector = FALSE)
#   str(parsed)
#
#   jsonToDT <- function(x) {
#     tmp1 <- unlist(parsed$events[[x]])
#     tmp2 <- data.table(Variable=names(tmp1), Value=tmp1)
#     tmp2[, ID := x]
#     return(tmp2)
#   }
#
#   datOut <- rbindlist(lapply(1:length(parsed$events), jsonToDT), fill=TRUE)
#   datOut[, .N, keyb=.(Variable)]
#   datOut[Variable %like% "slug"]
#   datOutConsol <- datOut[Variable %like% "stats" | Variable=="datetime_local" | Variable=="title" | Variable=="popularity" |
#         Variable=="venue.display_location" | Variable=="venue.name" | Variable %like% "score" | Variable=="id"]
#   sapply(datOutConsol$Value, class)
#   sapply(datOutConsol, class)
#   datOutConsol[, Count := .N, by=.(ID, Variable)]
#   datOutConsol[Count > 1, RowOrd := 1:.N, by=.(ID, Variable)]
#   datOutConsol[RowOrd==2, Variable := paste0(Variable,".opponent")]
#   datOutConsolWide <- dcast(datOutConsol, ID~Variable, value.var="Value",fun.aggregate = function(x) unique(x)[1])
#
# }



# datOutConsol[ID==1]
# datOutConsol[, Title := Value[Variable=="title"][1L], by=.(ID)]
#
# datSummary <- datOutConsol[Variable == "title", .N, keyby=.(ID,Title=Value)][, N := NULL][]
# datOut[datSummary, Title := i.Title, on=.(ID)]
# datOut[, ExtractTime := as.character(Sys.time())]
# datOut[Variable %like% "stats"]
#
#
# url <- paste0("https://api.seatgeek.com/2/events?client_id=",
#               MYCLIENTID,"&client_secret=",MYCLIENTSECRET)
# out <- GET(url=url)
# status_code(out)
#
# parsed <- jsonlite::fromJSON(content(out, "text"), simplifyVector = FALSE)
# url <- paste0("https://api.seatgeek.com/2/events/4027107?client_id=",
#               MYCLIENTID,"&client_secret=",MYCLIENTSECRET)
# out <- GET(url=url)
# status_code(out)
# parsed2 <- jsonlite::fromJSON(content(out, "text"), simplifyVector = FALSE)
#
#
# jsonToDT <- function(x) {
#   tmp1 <- unlist(parsed$events[[x]])
#   tmp2 <- data.table(Variable=names(tmp1), Value=tmp1)
#   tmp2[, ID := x]
#   return(tmp2)
# }
#
# datOut <- rbindlist(lapply(1:length(parsed$events), jsonToDT), fill=TRUE)
# datOut[Variable=="performers.short_name"]
# datOut[Variable=="venue.extended_address"]
#
#
# tmp1 <- unlist(parsed$events[[1]])
# tmp2 <- data.table(Variable=names(tmp1), Value=tmp1)
#
# # curl 'https://api.seatgeek.com/2/events?performers.slug=new-york-mets'
#
# url <- paste0("https://api.seatgeek.com/2/events?client_id=",
#                MYCLIENTID,"&client_secret=",MYCLIENTSECRET)
# out <- GET(url=url)
# status_code(out)
#
# parsed <- jsonlite::fromJSON(content(out, "text"), simplifyVector = FALSE)
#
# url <- paste0("https://api.seatgeek.com/2/events?performers.slug=new-york-knicks&client_id=",
#                MYCLIENTID,"&client_secret=",MYCLIENTSECRET)
# out <- GET(url=url)
# status_code(out)
# parsed3 <- jsonlite::fromJSON(content(out, "text"), simplifyVector = FALSE)
# parsed3
#
# parsed <- jsonlite::fromJSON(content(out, "text"), simplifyVector = FALSE)
#
#
# url <- paste0("https://api.seatgeek.com/2/events?performers.slug=huskers&client_id=",
#                MYCLIENTID,"&client_secret=",MYCLIENTSECRET)
# out <- GET(url=url)
# status_code(out)
# parsed3 <- jsonlite::fromJSON(content(out, "text", encoding = "UTF-8"), simplifyVector = FALSE)
# str(parsed3)
#
#
#
# url <- paste0("https://api.seatgeek.com/2/events?performers.slug=nebraska-cornhuskers-football&client_id=",
#                MYCLIENTID,"&client_secret=",MYCLIENTSECRET)
# out <- GET(url=url)
# status_code(out)
# parsed3 <- jsonlite::fromJSON(content(out, "text", encoding = "UTF-8"), simplifyVector = FALSE)
# str(parsed3)
# parsed3$events[[1]]$title
# parsed3$events[[1]]$id
#
# url <- paste0("https://api.seatgeek.com/2/events/3645388?client_id=",
#               MYCLIENTID,"&client_secret=",MYCLIENTSECRET)
# out <- GET(url=url)
# status_code(out)
# parsed2 <- jsonlite::fromJSON(content(out, "text"), simplifyVector = FALSE)
# parsed2$title
# parsed2$url
#
# library(rvest)
# x1 <- read_html(parsed2$url)
# x2 <- html_nodes(x1, "#react-map")
# x2
#
# # docker run -d -p 4444:4444 selenium/standalone-chrome:3.6.0-bromine
# require(RSelenium)
# RSelenium::startServer()
# remDr <- remoteDriver(browserName = "phantomjs")
# remDr$open()
# remDr$navigate("http://www.google.com/ncr")
# remDr$close()
# remDr$closeServer()
#
# require(RSelenium)
# pJS <- phantom()
# Sys.sleep(5) # give the binary a moment
# remDr <- remoteDriver(browserName = 'phantomjs')
# remDr$open()
# remDr$navigate("https://seatgeek.com/ohio-state-buckeyes-at-nebraska-cornhuskers-football-tickets/ncaa-football/2017-10-14-6-30-pm/3645388")
# remDr$getTitle()[[1]] # [1] "Google"
# remDr$close
# pJS$stop() # close the PhantomJS process, note we dont call remDr$closeServer()
# # str(parsed$events[[1]])
# # str(parsed$events[[1]]$venue)
# # tmp1 <- unlist(parsed$events[[1]]$venue)
# # data.table(Variable=names(tmp1), Value=tmp1)
# #
# #
# # as.data.table(parsed$events[[1]]$venue)
# # outDat <- rbindlist(lapply(parsed$events[[1]]$data$concepts, as.data.table), fill=TRUE)
# # outDat[, File := imagePath]
