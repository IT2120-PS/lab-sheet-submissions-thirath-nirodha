setwd("C:\\Users\\am\\Desktop\\New folder")
Delivery_Times<- read.table("Exercise - Lab 05.txt", header = FALSE)
names(Delivery_Times)<- "Delivery_Time"

#convert to numeric vector
Delivery_Time<- as.numeric(Delivery_Times$Delivery_Time)

View(Delivery_Times)
attach(Delivery_Times)


histogram <- hist(Delivery_Time, 
                 main = "Histogram of Delivery Times", 
                 xlab = "Delivery Time (minutes)",
                 breaks = seq(20, 70, length = 10),
                 right = FALSE,
                 col = "lightblue")


#The distribution appears to be approximately symmetric with a slight right skew.
#Most delivery times are clustered around 35-55 minutes, with fewer very short
#20-30 minutes and very long 60-70 delivery times.


breaks<- round(histogram$breaks)
freq<-histogram$counts
cum.freq<- cumsum(freq)
freq
new<- c(0, cum.freq)

plot(breaks, cumulative_data, 
     type = "l", 
     main = "Cumulative Frequency Polygon (Ogive) for Delivery Times",
     xlab = "Delivery Time (minutes)", 
     ylab = "Cumulative Frequency",
     col = "blue", 
     lwd = 2,
     ylim = c(0, max(cumulative_data) + 5))

# Add points to the ogive
points(breaks, cumulative_data, pch = 16, col = "red")

# Display cumulative frequency table
cbind(Upper_Limit = breaks, Cumulative_Frequency = new)
