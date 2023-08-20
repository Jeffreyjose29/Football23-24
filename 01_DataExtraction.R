# Package names
packages <- c("tidyverse", "ggplot2", "devtools", "StatsBombR", "SBpitch", "hrbrthemes", "grid", "worldfootballR")

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# Packages loading
invisible(lapply(packages, library, character.only = TRUE))


# Gathering transfer information
team_urls <- tm_league_team_urls(country_name = "England", start_year = 2023)
epl_xfers <- tm_team_transfers(team_url = team_urls, transfer_window = "all")
