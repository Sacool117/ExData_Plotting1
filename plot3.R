##Read data
data_path <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
pc_data <- read.table(data_path, skip = 1, sep = ";", stringsAsFactors = FALSE)
names(pc_data) <- c("Date", "Time", "Global_active_power", "Global_reative_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

##Subset data
pc_sub_data <- subset(pc_data, pc_data$Date == "1/2/2007" | pc_data$Date == "2/2/2007")
pc_sub_data$Global_active_power <- as.numeric(pc_sub_data$Global_active_power)

##Transformation of Date and Time variable into a common Date type/ Posixlt
pc_sub_data$Date <- as.Date(pc_sub_data$Date, format = "%d/%m/%Y")
pc_sub_data$Time <- strptime(pc_sub_data$Time, format = "%H:%M:%S")
pc_sub_data[1:1440,"Time"] <- format(pc_sub_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
pc_sub_data[1441:2880,"Time"] <- format(pc_sub_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

##Create plot3
png("plot3.png", height = 480, width = 480)
plot(x = pc_sub_data$Time, y = pc_sub_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
with(pc_sub_data, lines(Time, as.numeric(Sub_metering_1), col = "black"))
with(pc_sub_data, lines(Time, as.numeric(Sub_metering_2), col = "red"))
with(pc_sub_data, lines(Time, as.numeric(Sub_metering_3), col = "blue"))
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
dev.off()

