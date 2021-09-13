sat_score <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv")
glimpse(sat_score)
#How many observation of this dataset (before cleaning) ?
sat_score%>%count() 
#Are there duplicate data sets ? (If have duplicate data, list the data that duplicate)
sat_score%>%duplicated()
#How many distinct school in this dataset ?
sat_score%>%distinct()%>%count()  #7
#What is min, max, average, quartile of each part in SAT ?
sat_score%>%max()