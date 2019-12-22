##Read data
data_path <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
pc_data <- read.table(data_path, skip = 1, sep = ";", stringsAsFactors = FALSE)
names(pc_data) <- c("Date", "Time", "Global_active_power", "Global_reative_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

##Subset data
pc_sub_data <- subset(pc_data, pc_data$Date == "1/2/2007" | pc_data$Date == "2/2/2007")
pc_sub_data$Global_active_power <- as.numeric(pc_sub_data$Global_active_power)
pc_sub_data$Date <- as.Date(pc_sub_data$Date)

##Create plot 1
png("plot1.png", height = 480, width = 480)
hist(pc_sub_data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()


