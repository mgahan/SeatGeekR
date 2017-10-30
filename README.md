SeatgeekR
---------

### Install package

    devtools::install_github("mgahan/SeatGeekR")
    library(SeatGeekR)

### Example

A **R** package that allows the user to scrape ticket information from
the Seatgeek API

    exampleOutput <- seatgeek_extract_slug(TEAM_NAME="nebraska-cornhuskers-football")
    kable(exampleOutput[, .(title, stats.average_price, stats.highest_price, stats.listing_count, stats.lowest_price)])

<table>
<thead>
<tr class="header">
<th align="left">title</th>
<th align="left">stats.average_price</th>
<th align="left">stats.highest_price</th>
<th align="left">stats.listing_count</th>
<th align="left">stats.lowest_price</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Northwestern Wildcats at Nebraska Cornhuskers Football</td>
<td align="left">100</td>
<td align="left">601</td>
<td align="left">1127</td>
<td align="left">32</td>
</tr>
<tr class="even">
<td align="left">Nebraska Cornhuskers at Minnesota Golden Gophers Football</td>
<td align="left">161</td>
<td align="left">347</td>
<td align="left">803</td>
<td align="left">90</td>
</tr>
<tr class="odd">
<td align="left">Nebraska Cornhuskers at Penn State Nittany Lions Football</td>
<td align="left">208</td>
<td align="left">1473</td>
<td align="left">1376</td>
<td align="left">98</td>
</tr>
<tr class="even">
<td align="left">Iowa Hawkeyes at Nebraska Cornhuskers Football</td>
<td align="left">173</td>
<td align="left">711</td>
<td align="left">1560</td>
<td align="left">65</td>
</tr>
<tr class="odd">
<td align="left">Purdue Boilermakers at Nebraska Cornhuskers Football</td>
<td align="left">209</td>
<td align="left">216</td>
<td align="left">3</td>
<td align="left">204</td>
</tr>
<tr class="even">
<td align="left">Illinois Fighting Illini at Nebraska Cornhuskers Football</td>
<td align="left">209</td>
<td align="left">216</td>
<td align="left">3</td>
<td align="left">204</td>
</tr>
</tbody>
</table>

### API Keys

Before accessing the API, you must visit the SeatGeek API and create
your credentials here;

<https://seatgeek.com/account/develop>

Seatgeek makes it pretty easy to get your credentials. Also, as of this
time, Seatgeek does not really seem to have limits on their API.

### Team Names

Right now, this package has the main functionality of being able to
search by team name. In the future, I hope to allow the app to search by
more. I do have a list of teamnames available for those interested.

    fpath <- system.file("Teams", "Team_Slug_Names.csv", package="SeatGeekR")
    TeamNames <- fread(fpath)
    kable(tail(TeamNames))

<table>
<thead>
<tr class="header">
<th align="left">Sport</th>
<th align="left">Team</th>
<th align="left">Conference</th>
<th align="left">Division</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">NCAA Football</td>
<td align="left">missouri-tigers-football</td>
<td align="left">SEC</td>
<td align="left">East</td>
</tr>
<tr class="even">
<td align="left">NCAA Football</td>
<td align="left">ole-miss-rebels-football</td>
<td align="left">SEC</td>
<td align="left">West</td>
</tr>
<tr class="odd">
<td align="left">NCAA Football</td>
<td align="left">south-carolina-gamecocks-football</td>
<td align="left">SEC</td>
<td align="left">East</td>
</tr>
<tr class="even">
<td align="left">NCAA Football</td>
<td align="left">tennessee-volunteers-football</td>
<td align="left">SEC</td>
<td align="left">East</td>
</tr>
<tr class="odd">
<td align="left">NCAA Football</td>
<td align="left">texas-a-m-aggies-football</td>
<td align="left">SEC</td>
<td align="left">West</td>
</tr>
<tr class="even">
<td align="left">NCAA Football</td>
<td align="left">vanderbilt-commodores-football</td>
<td align="left">SEC</td>
<td align="left">East</td>
</tr>
</tbody>
</table>
