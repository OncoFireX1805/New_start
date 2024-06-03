library(rvest)
library(dplyr)
html_file<-"C:/Users/parth/OneDrive/Desktop/New_start/multiqc_report.html"
#let R read the HTML file 
html_content<-read_html(html_file)
#extracting tables form HTML 
tables<-html_content%>%html_nodes("table")
#saving all tables to CSV and looping all the tables 

# Loop through each table and save it as a CSV file
for (i in seq_along(tables)) {
  # Read the table into a data frame
  df <- html_table(tables[[i]], fill = TRUE)
  
  # Define the CSV file name
  csv_filename <- paste0("multiqc_table_", i, ".csv")
  
  # Save the data frame to a CSV file
  write.csv(df, file = csv_filename, row.names = FALSE)
  
  print(paste("Saved", csv_filename))
}
View(df)



