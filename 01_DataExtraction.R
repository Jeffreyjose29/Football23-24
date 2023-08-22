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
