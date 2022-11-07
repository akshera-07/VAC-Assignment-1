# IMPORTING LIBRARIES
library(rvest)
library(dplyr)
library(robotstxt)

#Checking whether website can be scrapped
path = paths_allowed("https://www.amazon.in/deal/1bf44bad?ref=dlx_deals_gd_dcl_img_1_1bf44bad_dt_sl15_7d")

# SCRAPPING WEBSITE
link <-
  'https://www.amazon.in/deal/1bf44bad?ref=dlx_deals_gd_dcl_img_1_1bf44bad_dt_sl15_7d'


# HTML ELEMENTS FROM WEBSITE
web <- read_html(link)

# SEGREGATING NAMES
name <- web %>%html_nodes(".a-text-normal")%>% html_text()

# VIEWING NAME LIST
View(name)

# SEGREGATING YEARS
price <- web %>% html_nodes(".a-price-whole") %>% html_text()

# VIEW YEAR LIST
View(price)

# CREATING DATAFRAME
bluetoothprice <- data.frame(name, price)

# VIEW DATAFRAME
View(bluetoothprice)

# SAVING DATA
write.csv (bluetoothprice, "My_bluetoothprice.csv")
