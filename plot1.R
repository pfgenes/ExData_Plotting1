# Criteria
	# was a valid GitHub URL containing a git repository usbmitted
	# does the github rep contain at least one commit beyond the original fork
	# do files appear to be correct graphics format
	# does each plot appear correct
	# does each set of R code appear to creat the reference plot

# Load Data Set

power_cons <-  read.table("household_power_consumption.txt", stringsAsFactors = FALSE,header = TRUE, sep = ";")

# Change Date column from character to date variable
power_cons$Date <- as.Date(power_cons$Date, format = "%d/%m/%Y")

# Subset dataset

subset <- subset(power_cons, Date == "2007-02-01" | Date == "2007-02-02")

# Construct plots and save to 480x480 pixel png
# save files as plot1.png, plot2.png, etc.
#Should create separate R code file that constructs plot and creates png ("plot1.R"	)
# should be 4 png files nad 4 R code files

