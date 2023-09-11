# Package names
packages <- c("tidyverse", "ggplot2", "devtools", "StatsBombR", "SBpitch", "hrbrthemes", "grid", "worldfootballR")

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# Packages loading
invisible(lapply(packages, library, character.only = TRUE))

# Setting Working Directory
setwd("C:/Users/jeffr/OneDrive/Desktop/Github Activities/Football23-24/Datasets")

# 1. Gather all the team names in the premier league
teams <- fb_season_team_stats(country = "ENG", gender = "M", season_end_year = 2024, tier = "1st", stat_type = "shooting")
teams <- teams %>%
  select(Squad) %>%
  filter(!str_detect(Squad, '^vs '))
teams <- as.data.frame(unique(teams$Squad))
colnames(teams)[1] <- "Team"

teams$image_url <- if_else(teams$Team == "Arsenal", "https://assets.stickpng.com/images/580b57fcd9996e24bc43c4df.png",
                           if_else(teams$Team == "Aston Villa", "https://logodownload.org/wp-content/uploads/2019/10/aston-villa-logo-1.png",
                                   if_else(teams$Team == "Bournemouth", "https://logodownload.org/wp-content/uploads/2019/10/bournemouth-fc-logo-1.png",
                                           if_else(teams$Team == "Brentford", "https://upload.wikimedia.org/wikipedia/en/thumb/2/2a/Brentford_FC_crest.svg/1200px-Brentford_FC_crest.svg.png",
                                                   if_else(teams$Team == "Brighton", "https://upload.wikimedia.org/wikipedia/sco/thumb/f/fd/Brighton_%26_Hove_Albion_logo.svg/1200px-Brighton_%26_Hove_Albion_logo.svg.png",
                                                           if_else(teams$Team == "Burnley", "https://upload.wikimedia.org/wikipedia/en/thumb/6/6d/Burnley_FC_Logo.svg/1200px-Burnley_FC_Logo.svg.png",
                                                                   if_else(teams$Team == "Chelsea", "https://logodownload.org/wp-content/uploads/2017/02/chelsea-fc-logo-0.png",
                                                                           if_else(teams$Team == "Crystal Palace", "https://upload.wikimedia.org/wikipedia/hif/c/c1/Crystal_Palace_FC_logo.png",
                                                                                   if_else(teams$Team == "Everton", "https://logodownload.org/wp-content/uploads/2019/04/everton-logo-escudo-3.png",
                                                                                           if_else(teams$Team == "Fulham", "https://logos-download.com/wp-content/uploads/2018/09/FC_Fulham_Logo.png",
                                                                                                   if_else(teams$Team == "Liverpool", "https://assets.stickpng.com/images/580b57fcd9996e24bc43c4e5.png",
                                                                                                           if_else(teams$Team == "Luton Town", "https://static.wikia.nocookie.net/logopedia/images/7/76/Luton_Town_FC_logo_%28130_Years%29.png/revision/latest?cb=20151121195540",
                                                                                                                   if_else(teams$Team == "Manchester City", "https://cdn.freebiesupply.com/images/large/2x/manchester-city-logo-png-transparent.png",
                                                                                                                           if_else(teams$Team == "Manchester Utd", "https://assets.stickpng.com/images/580b57fcd9996e24bc43c4e7.png",
                                                                                                                                   if_else(teams$Team == "Newcastle Utd", "https://upload.wikimedia.org/wikipedia/hif/2/25/Newcastle_United_Logo.png",
                                                                                                                                           if_else(teams$Team == "Nott'ham Forest", "https://cdn.freebiesupply.com/logos/large/2x/nottingham-forest-fc-logo-png-transparent.png",
                                                                                                                                                   if_else(teams$Team == "Sheffield Utd", "https://upload.wikimedia.org/wikipedia/en/thumb/9/9c/Sheffield_United_FC_logo.svg/1200px-Sheffield_United_FC_logo.svg.png",
                                                                                                                                                           if_else(teams$Team == "Tottenham", "https://upload.wikimedia.org/wikipedia/hif/6/6d/Tottenham_Hotspur.png",
                                                                                                                                                                   if_else(teams$Team == "West Ham", "https://logodownload.org/wp-content/uploads/2019/05/west-ham-united-logo-3.png",
                                                                                                                                                                           if_else(teams$Team == "Wolves", "https://logodownload.org/wp-content/uploads/2019/04/wolverhampton-logo-escudo.png",
                                                                                                                                                                           # Wolves
                                                                                                                                                                          NA))))))))))))))))))))


# Trophies image link
teams$TrophyImgLink <- if_else(teams$Team == "Arsenal", "https://i.ibb.co/v4pHMyG/Arsenal.png",
                               if_else(teams$Team == "Aston Villa", "https://i.ibb.co/Pj9VfWk/Aston-Villa.png",
                                       if_else(teams$Team == "Bournemouth", "https://i.ibb.co/P9TmrV7/Bournemouth-FC.png",
                                               if_else(teams$Team == "Brentford", "https://i.ibb.co/3MRQBtC/Brentford-FC.png",
                                                       if_else(teams$Team == "Brighton", "https://i.ibb.co/wzjNw5d/Brighton-Hove-Albion.png",
                                                               if_else(teams$Team == "Burnley", "https://i.ibb.co/BZVpK3t/Burnley-FC.png",
                                                                       if_else(teams$Team == "Chelsea", "https://i.ibb.co/YLhRhyv/Chelsea-FC.png",
                                                                               if_else(teams$Team == "Crystal Palace", "https://i.ibb.co/CWR7MDB/Crystal-Palace.png",
                                                                                       if_else(teams$Team == "Everton", "https://i.ibb.co/gjBwhJ4/Everton-FC.png",
                                                                                               if_else(teams$Team == "Fulham", "https://i.ibb.co/JjxJ62F/Fulham-FC.png",
                                                                                                       if_else(teams$Team == "Liverpool", "https://i.ibb.co/xMt9MsD/Liverpool-FC.png",
                                                                                                               if_else(teams$Team == "Luton Town", "https://i.ibb.co/KrnHTbW/Luton-Town.png",
                                                                                                                       if_else(teams$Team == "Manchester City", "https://i.ibb.co/4mS64qx/Manchester-City.png",
                                                                                                                               if_else(teams$Team == "Manchester Utd", "https://i.ibb.co/hYx2n67/Manchester-United.png",
                                                                                                                                       if_else(teams$Team == "Newcastle Utd", "https://i.ibb.co/8NqjWRv/Newcastle-United.png",
                                                                                                                                               if_else(teams$Team == "Nott'ham Forest", "https://i.ibb.co/nLDzJrt/Nottingham-Forest.png",
                                                                                                                                                       if_else(teams$Team == "Sheffield Utd", "https://i.ibb.co/T04gbw3/Sheffield-United.png",
                                                                                                                                                               if_else(teams$Team == "Tottenham", "https://i.ibb.co/PTS3Cjd/Tottenham-Hotspur.png",
                                                                                                                                                                       if_else(teams$Team == "West Ham", "https://i.ibb.co/Vxq9gwy/West-Ham-United.png",
                                                                                                                                                                               if_else(teams$Team == "Wolves", "https://i.ibb.co/mG3JFTh/Wolverhampton-Wanderers.png",
                                                                                                                                                                               # Wolves
                                                                                                                                                                               NA))))))))))))))))))))




teams$Founded <- if_else(teams$Team == "Arsenal", 1886,
                         if_else(teams$Team == "Aston Villa", 1874,
                                 if_else(teams$Team == "Bournemouth", 1899,
                                         if_else(teams$Team == "Brentford", 1889,
                                                 if_else(teams$Team == "Brighton", 1901,
                                                         if_else(teams$Team == "Burnley", 1882,
                                                                 if_else(teams$Team == "Chelsea", 1905,
                                                                         if_else(teams$Team == "Crystal Palace", 1905,
                                                                                 if_else(teams$Team == "Everton", 1878,
                                                                                         if_else(teams$Team == "Fulham", 1879,
                                                                                                 if_else(teams$Team == "Liverpool", 1892,
                                                                                                         if_else(teams$Team == "Luton Town", 1885,
                                                                                                                 if_else(teams$Team == "Manchester City", 1880,
                                                                                                                         if_else(teams$Team == "Manchester Utd", 1878,
                                                                                                                                 if_else(teams$Team == "Newcastle Utd", 1892,
                                                                                                                                         if_else(teams$Team == "Nott'ham Forest", 1865,
                                                                                                                                                 if_else(teams$Team == "Sheffield Utd", 1889,
                                                                                                                                                         if_else(teams$Team == "Tottenham", 1882,
                                                                                                                                                                 if_else(teams$Team == "West Ham", 1895,
                                                                                                                                                                         if_else(teams$Team == "Wolves", 1877,
                                                                                                                                                                                 # Wolves
                                                                                                                                                                                 NA))))))))))))))))))))

teams$Wesbite <- if_else(teams$Team == "Arsenal", "www.arsenal.com",
                         if_else(teams$Team == "Aston Villa", "www.avfc.co.uk",
                                 if_else(teams$Team == "Bournemouth", "	ww.afcb.co.uk",
                                         if_else(teams$Team == "Brentford", "www.brentfordfc.co.uk",
                                                 if_else(teams$Team == "Brighton", "www.brightonandhovealbion.com",
                                                         if_else(teams$Team == "Burnley", "	www.burnleyfootballclub.com",
                                                                 if_else(teams$Team == "Chelsea", "	www.chelseafc.com",
                                                                         if_else(teams$Team == "Crystal Palace", "www.cpfc.co.uk",
                                                                                 if_else(teams$Team == "Everton", "www.evertonfc.com",
                                                                                         if_else(teams$Team == "Fulham", "www.fulhamfc.com",
                                                                                                 if_else(teams$Team == "Liverpool", "	www.liverpoolfc.com",
                                                                                                         if_else(teams$Team == "Luton Town", "www.lutontown.co.uk",
                                                                                                                 if_else(teams$Team == "Manchester City", "www.mancity.com",
                                                                                                                         if_else(teams$Team == "Manchester Utd", "www.manutd.com",
                                                                                                                                 if_else(teams$Team == "Newcastle Utd", "www.nufc.co.uk",
                                                                                                                                         if_else(teams$Team == "Nott'ham Forest", "www.nottinghamforest.co.uk",
                                                                                                                                                 if_else(teams$Team == "Sheffield Utd", "	www.sufc.co.uk",
                                                                                                                                                         if_else(teams$Team == "Tottenham", "	www.tottenhamhotspur.com",
                                                                                                                                                                 if_else(teams$Team == "West Ham", "www.whufc.com",
                                                                                                                                                                         if_else(teams$Team == "Wolves", "www.wolves.co.uk",
                                                                                                                                                                                 # Wolves
                                                                                                                                                                                 NA))))))))))))))))))))


teams$PreferredFormation <- if_else(teams$Team == "Arsenal", "4-3-3 Attacking",
                               if_else(teams$Team == "Aston Villa", "4-4-2 Double 6",
                                       if_else(teams$Team == "Bournemouth", "4-2-3-1",
                                               if_else(teams$Team == "Brentford", "3-5-2 Flat",
                                                       if_else(teams$Team == "Brighton", "4-2-3-1",
                                                               if_else(teams$Team == "Burnley", "4-2-3-1",
                                                                       if_else(teams$Team == "Chelsea", "4-3-3 Attacking",
                                                                               if_else(teams$Team == "Crystal Palace", "4-3-3 Attacking",
                                                                                       if_else(teams$Team == "Everton", "4-2-2 Double 6",
                                                                                               if_else(teams$Team == "Fulham", "4-2-3-1",
                                                                                                       if_else(teams$Team == "Liverpool", "4-3-3 Attacking",
                                                                                                               if_else(teams$Team == "Luton Town", "3-4-1-2",
                                                                                                                       if_else(teams$Team == "Manchester City", "4-3-3 Attacking",
                                                                                                                               if_else(teams$Team == "Manchester Utd", "4-2-3-1",
                                                                                                                                       if_else(teams$Team == "Newcastle Utd", "4-3-3 Attacking",
                                                                                                                                               if_else(teams$Team == "Nott'ham Forest", " 3-4-1-2",
                                                                                                                                                       if_else(teams$Team == "Sheffield Utd", "3-5-2 Flat",
                                                                                                                                                               if_else(teams$Team == "Tottenham", "4-3-3 Attacking",
                                                                                                                                                                       if_else(teams$Team == "West Ham", "4-2-3-1",
                                                                                                                                                                               if_else(teams$Team == "Wolves", "4-2-3-1",
                                                                                                                                                                                       # Wolves
                                                                                                                                                                                       NA))))))))))))))))))))

# Rewrite the team names so that it is matching with the transfer data
teams$Team <- if_else(teams$Team == "Arsenal", "Arsenal FC",
                           if_else(teams$Team == "Aston Villa", "Aston Villa",
                                   if_else(teams$Team == "Bournemouth", "AFC Bournemouth",
                                           if_else(teams$Team == "Brentford", "Brentford FC",
                                                   if_else(teams$Team == "Brighton", "Brighton & Hove Albion",
                                                           if_else(teams$Team == "Burnley", "Burnley FC",
                                                                   if_else(teams$Team == "Chelsea", "Chelsea FC",
                                                                           if_else(teams$Team == "Crystal Palace", "Crystal Palace",
                                                                                   if_else(teams$Team == "Everton", "Everton FC",
                                                                                           if_else(teams$Team == "Fulham", "Fulham FC",
                                                                                                   if_else(teams$Team == "Liverpool", "Liverpool FC",
                                                                                                           if_else(teams$Team == "Luton Town", "Luton Town",
                                                                                                                   if_else(teams$Team == "Manchester City", "Manchester City",
                                                                                                                           if_else(teams$Team == "Manchester Utd", "Manchester United",
                                                                                                                                   if_else(teams$Team == "Newcastle Utd", "Newcastle United",
                                                                                                                                           if_else(teams$Team == "Nott'ham Forest", "Nottingham Forest",
                                                                                                                                                   if_else(teams$Team == "Sheffield Utd", "Sheffield United",
                                                                                                                                                           if_else(teams$Team == "Tottenham", "Tottenham Hotspur",
                                                                                                                                                                   if_else(teams$Team == "West Ham", "West Ham United",
                                                                                                                                                                           if_else(teams$Team == "Wolves", "Wolverhampton Wanderers",
                                                                                                                                                                           # Wolves
                                                                                                                                                                           NA))))))))))))))))))))






write.csv(teams, "Teams.csv", row.names = FALSE)



# 2. Gathering transfer information
for(i in 2019:2023){
  team_urls <- tm_league_team_urls(country_name = "England", start_year = i)
  if(i == 2019){
    epl_xfers <- tm_team_transfers(team_url = team_urls, transfer_window = "all")
  }else{
    epl_xfers <- rbind(tm_team_transfers(team_url = team_urls, transfer_window = "all"), epl_xfers)
  }
  
}

# Remove all the players that came back from loan spells
epl_xfers <- epl_xfers[- grep("End of loan", epl_xfers$transfer_notes),]
epl_xfers$finance_symbol <- if_else(epl_xfers$transfer_type == "Arrivals", "Expenditure", "Income")


write.csv(epl_xfers, "Transfers.csv", row.names = FALSE)


# 3. Stadium Dataset
Team <- c("AFC Bournemouth", "Arsenal FC", "Aston Villa", "Brentford FC", "Brighton & Hove Albion", "Burnley FC", "Chelsea FC",
          "Crystal Palace", "Everton FC", "Fulham FC", "Liverpool FC", "Luton Town", "Manchester City", "Manchester United",
          "Newcastle United", "Nottingham Forest", "Sheffield United", "Tottenham Hotspur", "West Ham United", "Wolverhampton Wanderers")

Stadium <- c("Dean Court", "Emirates Stadium", "Villa Park", "Gtech Community Stadium", "Falmer Stadium", "Turf Moor", "Stamford Bridge",
             "Selhurst Park", "Goodison Park", "Craven Cottage", "Anfield", "Kenilworth Road", "Etihad Stadium", "Old Trafford",
             "St James's Park", "City Ground", "Bramall Lane", "Tottenham Hotspur Stadium", "London Stadium", "Molineux Stadium")

Capacity <- c(11307, 60704, 42657, 17250, 31800, 21944, 40343,
              25486, 39572, 22384, 53394, 11500, 53400, 74310,
              52305, 30332, 31884, 62850, 62500, 31750)

StadiumImg <- c("https://footballarroyo.co.uk/wp-content/uploads/2022/11/Dean-Court-Stadium-Capacity-Tickets-Seating-Plan-Records-Location-Parking.jpg",
                "https://upload.wikimedia.org/wikipedia/commons/2/29/London_Emirates_Stadium_arsenal.jpg",
                "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Birmingham_aston_villa_park_stadium.jpg/1200px-Birmingham_aston_villa_park_stadium.jpg",
                "https://res.cloudinary.com/brentford-fc/image/upload/f_auto,q_auto:best,f_auto,c_fill,ar_16:9/Production/E17D9D94-220A-46C7-9DDE-5A481BF59360_yhcm1m.jpg",
                "https://2.bp.blogspot.com/-lcO4JvhVio4/V8nJKPIgBII/AAAAAAAABs8/QwFP7uXPiAEsgGCgtTlGYizVBE4egZmKwCEw/s1600/IMG_5522_2.jpg",
                "https://resources.premierleague.com/premierleague/photo/2020/12/05/f597a032-82f6-49d0-8857-6fa293c393bf/1289536896.jpg",
                "https://www.stadiumguide.com/wp-content/uploads/stamfordbridge_top.jpg",
                "https://upload.wikimedia.org/wikipedia/commons/f/fd/Selhurst_Park_Holmesdale_Stand.jpg",
                "https://upload.wikimedia.org/wikipedia/commons/e/ed/Liverpool_fc_everton_stadium.jpg",
                "https://s3.eu-west-1.amazonaws.com/gc-media-assets.fulhamfc.com/0d95f8a0-9a8d-11ea-82eb-e72516e18d3d.jpg",
                "https://nbcsports.brightspotcdn.com/dims4/default/3564562/2147483647/strip/true/crop/5616x3159+0+132/resize/1440x810!/quality/90/?url=https%3A%2F%2Fnbc-sports-production-nbc-sports.s3.amazonaws.com%2Fbrightspot%2Fda%2F39%2F4178679e24de53d20dc949dd0aa1%2Flfc-view01-final.jpg",
                "https://ichef.bbci.co.uk/news/976/cpsprodpb/17386/production/_108201159_gettyimages-656672884.jpg",
                "https://upload.wikimedia.org/wikipedia/commons/9/94/Manchester_city_etihad_stadium.jpg",
                "https://i2-prod.mirror.co.uk/incoming/article29529405.ece/ALTERNATES/s1200d/0_GettyImages-1472943422.jpg",
                "https://res.cloudinary.com/brentford-fc/image/upload/f_auto,q_auto:best,f_auto,q_100,c_fill,ar_16:9/Production/186CDA39-2DCB-471E-80CB-F0A78B826D01_s8cn0d.jpg",
                "https://ichef.bbci.co.uk/news/976/cpsprodpb/B958/production/_121184474_gettyimages-656718056.jpg",
                "https://upload.wikimedia.org/wikipedia/commons/b/b0/Sheffield_united_bramall_lane_stadium.jpg",
                "https://upload.wikimedia.org/wikipedia/commons/b/be/London_Tottenham_Hotspur_Stadium.jpg",
                "https://stillmed.olympics.com/media/Images/Olympic-Games/Olympic-Legacy/Olympic-Legacy-Stories/London-2012/2021/09/01/London-2012-London-Stadium.jpg",
                "https://events.wolves.co.uk/wp-content/uploads/2020/03/Molineux-From-Above.jpg")

Address <- c("Kings Park, Bournemouth BH7 7AF, United Kingdom",
             "Hornsey Rd, London N7 7AJ, United Kingdom",
             "Trinity Rd, Birmingham B6 6HE, United Kingdom",
             # Brenford Stadium (GTech Community Stadium)
             "Lionel Rd S, Brentford TW8 0RU, United Kingdom",
             "Village Way, Brighton and Hove, Brighton BN1 9BL, United Kingdom",
             "Turf Moor, 52-56 Harry Potts Way, Burnley BB10 4BX, United Kingdom",
             # Chelsea (Stamford Bridge)
             "Fulham Rd., London SW6 1HS, United Kingdom",
             "Holmesdale Rd, London SE25 6PU, United Kingdom",
             "Goodison Rd, Liverpool L4 4EL, United Kingdom",
             "Stevenage Rd, London SW6 6HH, United Kingdom",
             "Anfield Rd, Anfield, Liverpool L4 0TH, United Kingdom",
             "1 Maple Rd E, Luton LU4 8AW, United Kingdom",
             "Etihad Stadium, Ashton New Rd, Manchester M11 3FF, United Kingdom",
             "Sir Matt Busby Way, Old Trafford, Stretford, Manchester M16 0RA, United Kingdom",
             # Newcastle (St James Park)
             "Barrack Rd, Newcastle upon Tyne NE1 4ST, United Kingdom",
             "City Ground, Nottingham, NG2 5FJ",
             "Bramall Lane, Sheffield, S2 4SU",
             "782 High Rd, London N17 0BX, United Kingdom",
             "London E20 2ST, United Kingdom",
             "Waterloo Rd, Wolverhampton WV1 4QR, United Kingdom"
             )

Phone <- c("+44 344 576 1910",
           "+44 20 7619 5000",
           "+44 33 3323 1874",
           # Brentford (GTech Community Stadium)
           "+44 333 005 8521",
           "+44 1273 668855",
           "+44 1282 446800",
           "+44 207 565 1414",
           "+44 20 8768 6000",
           "+44 151 556 1878",
           "+44 203 871 0810",
           "+44 151 264 2500",
           # Luton Town (Kenilworth Road)
           "+44 158 2411 622",
           "+44 161 444 1894",
           "+44 161 676 7770",
           # St James Park
           "+44 844 372 1892",
           "+44 115 982 4444",
           "+44 114 253 7200",
           "+44 344 844 0102",
           "+44 20 8522 6000",
           "+44 1902 658666"
           )

Owner <- c("Structadene", "HOK Sports", "Archibald Leitch", "KSS Design Group", NA, "Archibald Leitch", 
           "Humphreys of Knightsbridge", "Archibald Leitch", "Archibald Leitch", "Archiblad Leitch", NA, "Arup Group & Populous", "Archibald Leitch",
           "Archibald Leitch", "Husband & Co & Miller Partnership", "Ward McHigh Associates", "Populous", "CLM Delivery Partner", "Archibald Leitch"
           )

epl_stadium <- data.frame(Team, Stadium, Capacity, Address, Phone, StadiumImg)


write.csv(epl_stadium, "Stadiums.csv", row.names = FALSE)


# 4. Manager Information

Team <- c("AFC Bournemouth", "Arsenal FC", "Aston Villa", "Brentford FC", "Brighton & Hove Albion", "Burnley FC", "Chelsea FC",
          "Crystal Palace", "Everton FC", "Fulham FC", "Liverpool FC", "Luton Town", "Manchester City", "Manchester United",
          "Newcastle United", "Nottingham Forest", "Sheffield United", "Tottenham Hotspur", "West Ham United", "Wolverhampton Wanderers")

Manager <- c("Andoni Iraola", "Mikel Arteta", "Unai Emery", "Thomas Frank", "Roberto De Zerbi", "Vincent Kompany", "Mauricio Pochettino",
             "Roy Hodgson", "Sean Dyche", "Marco Silva", "Jurgen Klopp", "Rob Edwards", "Pep Guadriola", "Erik ten Hag",
             "Eddie Howe", "Steve Cooper", "Paul Heckingbottom", "Ange Postecoglou", "David Moyes", "Gary O'Neil")

Full_Name <- c("Andoni Iraola Sagarna", "Mikel Arteta Amatriain", "Unai Emery Etxegoien", "Thomas Frank", "Roberto De Zerbi", "Vincent Jean Mpy Kompany", "Mauricio Roberto Pochettino Troseero",
               "Roy Hodgson", "Sean Mark Dyche", "Marco Alexandre Saraiva da Silva", "Jürgen Norbert Klopp", "Robert Owen Edwards", "Josep Guardiola Sala", "Erik ten Hag",
               "Edward John Frank Howe", "Steve Cooper", "Paul Heckingbottom", "Angelos Postecoglou", "David William Moyes", "Gary Paul O'Neil")

Age <- c(41, 41, 51, 49, 44, 37, 51, 
         76, 52, 46, 56, 40, 52, 53,
         45, 43, 46, 58, 60, 40)

Nationality <- c("Spain", "Spain", "Spain", "Denmark", "Italy", "Belgium", "Argentina", 
                 "England", "England", "Portugal", "Germany", "England", "Spain", "Netherlands",
                 "England", "Wales", "England", "Australia", "Scotland", "England")

ManagerImage <- c("https://www.afcb.co.uk/media/217297/andoni-iraola.jpg?anchor=center&mode=crop&width=420&height=640&quality=60",
                  "https://dailypost.ng/wp-content/uploads/2022/08/Arteta.jpg",
                  "https://www.coachesvoice.com/wp-content/webpc-passthru.php?src=https://www.coachesvoice.com/wp-content/uploads/2021/05/Coach-watch_-Unai-Emery_Mobile.jpg&nocache=1",
                  "https://breakingthelines.com/wp-content/uploads/2022/06/thomasfrank-1.png",
                  "https://img.a.transfermarkt.technology/portrait/big/32157-1683271864.jpg?lm=1",
                  "https://i2-prod.getreading.co.uk/incoming/article25361466.ece/ALTERNATES/s1200c/0_Burnley-manager-Vincent-Kompany.jpg",
                  "https://i2-prod.mirror.co.uk/incoming/article30112454.ece/ALTERNATES/s1200c/1_Mauricio-Pochettino-5.jpg",
                  "https://i.guim.co.uk/img/media/01b3b80286a28158ee07e3f407effec6c806ff28/4_82_2521_1512/master/2521.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=ce8ce7f592a5f87326779af42c535819",
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Sean_Dyche.jpg/1200px-Sean_Dyche.jpg",
                  "https://www.thetimes.co.uk/imageserver/image/%2Fmethode%2Ftimes%2Fprod%2Fweb%2Fbin%2Fc91b7612-292e-11ee-b33d-6d3f5a636b40.jpg?crop=3742%2C2494%2C886%2C26",
                  "https://upload.wikimedia.org/wikipedia/commons/8/81/J%C3%BCrgen_Klopp%2C_Liverpool_vs._Chelsea%2C_UEFA_Super_Cup_2019-08-14_04.jpg",
                  "https://www.watfordfc.com/storage/82324/wfcimages-3393020622-(1).jpg",
                  "https://img.a.transfermarkt.technology/portrait/big/5672-1631172709.jpg?lm=1",
                  "https://img.a.transfermarkt.technology/portrait/big/3816-1535533360.jpg?lm=1",
                  "https://i.dailymail.co.uk/1s/2023/09/01/11/74955319-12469853-image-a-29_1693564848989.jpg",
                  "https://www.planetsport.com/image-library/land/1200/n/nottingham-forest-manager-steve-cooper.jpg",
                  "https://i2-prod.examinerlive.co.uk/incoming/article26877096.ece/ALTERNATES/s615/0_Hecky.jpg",
                  "https://static.independent.co.uk/2023/08/18/15/6e4ba1346fa16f5df4091d268fc6d6b2Y29udGVudHNlYXJjaGFwaSwxNjkyNDUzNzY2-2.73253451.jpg",
                  "https://static.standard.co.uk/2023/03/31/22/GettyImages-1471189030.jpg?width=968&auto=webp&quality=50&crop=968%3A645%2Csmart",
                  "https://i.guim.co.uk/img/media/539e060afb453490abbd3a7116285b586b334ae4/0_130_3381_2028/master/3381.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=a3005b8d87ef5ec2958dd44ea700ac6c")

ManagerCareerPath <- c("https://i.ibb.co/n73G5tY/Andoni-Iraola.png", # 1
                       "https://i.ibb.co/JHSjBQN/Mikel-Arteta.png", # 2
                       "https://i.ibb.co/2MfCh8X/Unai-Emery.png", # 3
                       "https://i.ibb.co/M9TYXYD/Thomas-Frank.png", # 4
                       "https://i.ibb.co/L8QWFbg/Roberto-De-Zerbi.png", # 5
                       "https://i.ibb.co/2s4MzV8/Vincent-Kompany.png", # 6
                       "https://i.ibb.co/Z82VR6M/Mauricio-Pochettino.png", # 7
                       "https://i.ibb.co/2KfPzV5/Roy-Hodgson.png", # 8
                       "https://i.ibb.co/cN7V03s/Sean-Dyche.png", # 9
                       "https://i.ibb.co/6H62Mq0/Marco-Silva.png", # 10
                       "https://i.ibb.co/wwZQS25/Jurgen-Klopp.png", # 11
                       "https://i.ibb.co/71VzhG9/Rob-Edwards.png", # 12
                       "https://i.ibb.co/MfJ5tZ2/Pep-Guadriola.png", # 13
                       "https://i.ibb.co/yqVdshc/Erik-ten-Hag.png", # 14
                       "https://i.ibb.co/rZ50XpG/Eddie-Howe.png", # 15
                       "https://i.ibb.co/tXXbQKh/Steve-Cooper.png", # 16
                       "https://i.ibb.co/JcjGcwh/Paul-Heckingbottom.png", # 17
                       "https://i.ibb.co/VMkrWCq/Ange-Postecoglou.png", # 18
                       "https://i.ibb.co/gZDNLfj/David-Moyes.png", # 19
                       "https://i.ibb.co/wJwbgqD/Gary-O-Neil.png") # 20
                       

epl_managers <- data.frame(Team, Manager, Full_Name, Age, Nationality, ManagerImage, ManagerCareerPath)


write.csv(epl_managers, "Managers.csv", row.names = FALSE)


# 5. Players

squad_wages <- data.frame()
player_stats <- data.frame()
player_market_values <- data.frame()
for (i in 2019:2023) {
  tm_team_url <- tm_league_team_urls(country_name = "England", start_year = i)
  fb_teams_url <- fb_teams_urls(fb_league_urls("ENG", "M", i+1, "1st"))
  
  # 1. Squad Wages
  squad_wages_temp <- fb_squad_wages(team_urls = fb_teams_url)
  squad_wages <- rbind(squad_wages, squad_wages_temp)
  
  # 2. Player Stats
  player_stats_temp <- fb_team_player_stats(team_urls = fb_teams_url, stat = "standard")
  player_stats <- rbind(player_stats, player_stats_temp) 
  
  # 3. Market Value
  player_market_values_temp <- tm_player_market_values("England", start_year = i)
  player_market_values <- rbind(player_market_values, player_market_values_temp)
}

 player_market_values$Season <-
  if_else(player_market_values$season_start_year == 2019, "2019-2020",
          if_else(player_market_values$season_start_year == 2020, "2020-2021",
                  if_else(player_market_values$season_start_year == 2021, "2021-2022",
                          if_else(player_market_values$season_start_year == 2022, "2022-2023",
                                  if_else(player_market_values$season_start_year == 2023, "2023-2024",
                                          if_else(player_market_values$season_start_year == 2024, "2024-2025",
                                                  if_else(player_market_values$season_start_year == 2025, "2025-2026",
                                                          if_else(player_market_values$season_start_year == 2026, "2026-2027", "2027-2028"))))))))


epl_players <- merge(player_stats, squad_wages, by.x = c("Season", "Player"), by.y = c("Season", "Player"), all.x = TRUE, all.y = FALSE)
epl_players <- merge(epl_players, player_market_values, by.x = c("Season", "Player"), by.y = c("Season", "player_name"), all.x = TRUE, all.y = FALSE)

epl_players <- epl_players %>%
  select(Season, Player, Squad, Comp.x, Nation.x, Pos.x, MP_Playing_Time, Starts_Playing_Time, Min_Playing_Time, Mins_Per_90_Playing_Time, Gls, Ast,
         `G+A`, G_minus_PK, PK, PKatt, CrdY, CrdR, xG_Expected, `npxG+xAG_Expected`, xAG_Expected, `npxG+xAG_Expected`, PrgC_Progression, PrgP_Progression, PrgR_Progression,
         Gls_Per_Minutes, Ast_Per_Minutes, `G+A_Per_Minutes`, G_minus_PK_Per_Minutes, `G+A_minus_PK_Per_Minutes`, xG_Per_Minutes, xAG_Per_Minutes, `xG+xAG_Per_Minutes`, npxG_Per_Minutes, 
         `npxG+xAG_Per_Minutes`, PlayerURL, MP, Team, Age.y, WeeklyWageGBP, WeeklyWageEUR, WeeklyWageUSD, AnnualWageGBP, AnnualWageEUR, AnnualWageUSD,
         Notes, Url, season_start_year, player_num, player_position, player_dob, player_height_mtrs, player_foot, date_joined, joined_from, contract_expiry, player_market_value_euro, 
         player_url) %>%
  rename("Position" = Pos.x, "Competition" = Comp.x, "Nation" = Nation.x, "Age" = Age.y)


# Rewrite the team names so that it is matching with the transfer data
epl_players$Squad <- if_else(epl_players$Squad == "Arsenal", "Arsenal FC",
                      if_else(epl_players$Squad == "Aston Villa", "Aston Villa",
                              if_else(epl_players$Squad == "Bournemouth", "AFC Bournemouth",
                                      if_else(epl_players$Squad == "Brentford", "Brentford FC",
                                              if_else(epl_players$Squad == "Brighton & Hove Albion", "Brighton & Hove Albion",
                                                      if_else(epl_players$Squad == "Burnley", "Burnley FC",
                                                              if_else(epl_players$Squad == "Chelsea", "Chelsea FC",
                                                                      if_else(epl_players$Squad == "Crystal Palace", "Crystal Palace",
                                                                              if_else(epl_players$Squad == "Everton", "Everton FC",
                                                                                      if_else(epl_players$Squad == "Fulham", "Fulham FC",
                                                                                              if_else(epl_players$Squad == "Liverpool", "Liverpool FC",
                                                                                                      if_else(epl_players$Squad == "Luton Town", "Luton Town",
                                                                                                              if_else(epl_players$Squad == "Manchester City", "Manchester City",
                                                                                                                      if_else(epl_players$Squad == "Manchester United", "Manchester United",
                                                                                                                              if_else(epl_players$Squad == "Newcastle United", "Newcastle United",
                                                                                                                                      if_else(epl_players$Squad == "Nottingham Forest", "Nottingham Forest",
                                                                                                                                              if_else(epl_players$Squad == "Sheffield United", "Sheffield United",
                                                                                                                                                      if_else(epl_players$Squad == "Tottenham Hotspur", "Tottenham Hotspur",
                                                                                                                                                              if_else(epl_players$Squad == "West Ham United", "West Ham United",
                                                                                                                                                                      # Wolves
                                                                                                                                                                      "Wolverhampton Wanderers")))))))))))))))))))

write.csv(epl_players, "Players.csv", row.names = FALSE)



# 6. Matchday Table
matchday_table <- data.frame()
for(i in 2019:2023){
  print(i)
  matchday_table_temp <- tm_matchday_table(country_name = "England", start_year = i, matchday = 38)
  matchday_table_temp$Season <- i
  matchday_table_temp <- matchday_table_temp[1:20,]
  
  matchday_table <- rbind(matchday_table, matchday_table_temp)
}

# Rewrite the team names so that it is matching with the transfer data
matchday_table$squad <- if_else(matchday_table$squad == "Arsenal", "Arsenal FC",
                      if_else(matchday_table$squad == "Aston Villa", "Aston Villa",
                              if_else(matchday_table$squad == "Bournemouth", "AFC Bournemouth",
                                      if_else(matchday_table$squad == "Brentford", "Brentford FC",
                                              if_else(matchday_table$squad == "Brighton", "Brighton & Hove Albion",
                                                      if_else(matchday_table$squad == "Burnley", "Burnley FC",
                                                              if_else(matchday_table$squad == "Chelsea", "Chelsea FC",
                                                                      if_else(matchday_table$squad == "Crystal Palace", "Crystal Palace",
                                                                              if_else(matchday_table$squad == "Everton", "Everton FC",
                                                                                      if_else(matchday_table$squad == "Fulham", "Fulham FC",
                                                                                              if_else(matchday_table$squad == "Liverpool", "Liverpool FC",
                                                                                                      if_else(matchday_table$squad == "Luton", "Luton Town",
                                                                                                              if_else(matchday_table$squad == "Man City", "Manchester City",
                                                                                                                      if_else(matchday_table$squad == "Man Utd", "Manchester United",
                                                                                                                              if_else(matchday_table$squad == "Newcastle", "Newcastle United",
                                                                                                                                      if_else(matchday_table$squad == "Nottm Forest", "Nottingham Forest",
                                                                                                                                              if_else(matchday_table$squad == "Sheff Utd", "Sheffield United",
                                                                                                                                                      if_else(matchday_table$squad == "Tottenham", "Tottenham Hotspur",
                                                                                                                                                              if_else(matchday_table$squad == "West Ham", "West Ham United",
                                                                                                                                                                      if_else(matchday_table$squad == "Wolves", "Wolverhampton Wanderers",
                                                                                                                                                                      # Wolves
                                                                                                                                                                      NA))))))))))))))))))))




matchday_table <- matchday_table[complete.cases(matchday_table$squad),]

write.csv(matchday_table, "Standings.csv", row.names = FALSE)


# 7. Match Information
match_information <- data.frame()
for(i in 2020:2024){
  match_information_temp <- fb_match_results(country = "ENG", gender = "M", season_end_year = i, tier = "1st")
  match_information_temp$Season <- i-1
  match_information <- rbind(match_information, match_information_temp)
}



match_information$Home  <- if_else(match_information$Home  == "Arsenal", "Arsenal FC",
                              if_else(match_information$Home  == "Aston Villa", "Aston Villa",
                                      if_else(match_information$Home  == "Bournemouth", "AFC Bournemouth",
                                              if_else(match_information$Home  == "Brentford", "Brentford FC",
                                                      if_else(match_information$Home  == "Brighton", "Brighton & Hove Albion",
                                                              if_else(match_information$Home  == "Burnley", "Burnley FC",
                                                                      if_else(match_information$Home  == "Chelsea", "Chelsea FC",
                                                                              if_else(match_information$Home  == "Crystal Palace", "Crystal Palace",
                                                                                      if_else(match_information$Home  == "Everton", "Everton FC",
                                                                                              if_else(match_information$Home  == "Fulham", "Fulham FC",
                                                                                                      if_else(match_information$Home  == "Liverpool", "Liverpool FC",
                                                                                                              if_else(match_information$Home  == "Luton Town", "Luton Town",
                                                                                                                      if_else(match_information$Home  == "Manchester City", "Manchester City",
                                                                                                                              if_else(match_information$Home  == "Manchester Utd", "Manchester United",
                                                                                                                                      if_else(match_information$Home  == "Newcastle Utd", "Newcastle United",
                                                                                                                                              if_else(match_information$Home  == "Nott'ham Forest", "Nottingham Forest",
                                                                                                                                                      if_else(match_information$Home  == "Sheffield Utd", "Sheffield United",
                                                                                                                                                              if_else(match_information$Home  == "Tottenham", "Tottenham Hotspur",
                                                                                                                                                                      if_else(match_information$Home  == "West Ham", "West Ham United",
                                                                                                                                                                              if_else(match_information$Home  == "Wolves", "Wolverhampton Wanderers",
                                                                                                                                                                              # Wolves
                                                                                                                                                                              match_information$Home ))))))))))))))))))))

match_information$Away  <- if_else(match_information$Away  == "Arsenal", "Arsenal FC",
                                   if_else(match_information$Away  == "Aston Villa", "Aston Villa",
                                           if_else(match_information$Away  == "Bournemouth", "AFC Bournemouth",
                                                   if_else(match_information$Away  == "Brentford", "Brentford FC",
                                                           if_else(match_information$Away  == "Brighton", "Brighton & Hove Albion",
                                                                   if_else(match_information$Away  == "Burnley", "Burnley FC",
                                                                           if_else(match_information$Away  == "Chelsea", "Chelsea FC",
                                                                                   if_else(match_information$Away  == "Crystal Palace", "Crystal Palace",
                                                                                           if_else(match_information$Away  == "Everton", "Everton FC",
                                                                                                   if_else(match_information$Away  == "Fulham", "Fulham FC",
                                                                                                           if_else(match_information$Away  == "Liverpool", "Liverpool FC",
                                                                                                                   if_else(match_information$Away  == "Luton Town", "Luton Town",
                                                                                                                           if_else(match_information$Away  == "Manchester City", "Manchester City",
                                                                                                                                   if_else(match_information$Away  == "Manchester Utd", "Manchester United",
                                                                                                                                           if_else(match_information$Away  == "Newcastle Utd", "Newcastle United",
                                                                                                                                                   if_else(match_information$Away  == "Nott'ham Forest", "Nottingham Forest",
                                                                                                                                                           if_else(match_information$Away  == "Sheffield Utd", "Sheffield United",
                                                                                                                                                                   if_else(match_information$Away  == "Tottenham", "Tottenham Hotspur",
                                                                                                                                                                           if_else(match_information$Away  == "West Ham", "West Ham United",
                                                                                                                                                                                   if_else(match_information$Away  == "Wolves", "Wolverhampton Wanderers",
                                                                                                                                                                                           # Wolves
                                                                                                                                                                                           match_information$Away ))))))))))))))))))))



match_information <- merge(match_information, teams, by.x = "Home", by.y = "Team", all.x = TRUE, all.y = FALSE)
match_information <- match_information %>% rename("HomeImageLink" = image_url)
match_information <- merge(match_information, teams, by.x = "Away", by.y = "Team", all.x = TRUE, all.y = FALSE)
match_information <- match_information %>% rename("AwayImageLink" = image_url)
match_information <- subset(match_information, select = -c(TrophyImgLink.x, TrophyImgLink.y))


match_information[c("HomeImageLink", "AwayImageLink")][is.na(match_information[c("HomeImageLink", "AwayImageLink")])] <- "https://vectorseek.com/wp-content/uploads/2023/08/Premier-League-Logo-Vector.svg-.png"

match_information$RunDate <- as.Date(Sys.Date())
match_information <- match_information %>%
  filter(Date <= as.Date(Sys.Date()))


write.csv(match_information, "MatchInformation.csv", row.names = FALSE)
