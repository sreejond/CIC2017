# create training and testing subset

# import libraries
library(ggplot2)



# set working dir
setwd('C:/Users/sreej/Desktop/SDN/SDN_R_Code/CIC2017')

# Start writing to an output file
#sink('cor.txt')

# Clear the workspace
rm(list = ls())

# Load training data 
train_raw1 = read.csv("dataset/MachineLearningCVE/Monday-WorkingHours.pcap_ISCX.csv", header=T)
train_raw2 = read.csv("dataset/MachineLearningCVE/Tuesday-WorkingHours.pcap_ISCX.csv", header=T)
train_raw3 = read.csv("dataset/MachineLearningCVE/Wednesday-workingHours.pcap_ISCX.csv", header=T)
train_raw4 = read.csv("dataset/MachineLearningCVE/Thursday-WorkingHours-Morning-WebAttacks.pcap_ISCX.csv", header=T)
train_raw5 = read.csv("dataset/MachineLearningCVE/Thursday-WorkingHours-Afternoon-Infilteration.pcap_ISCX.csv", header=T)
train_raw6 = read.csv("dataset/MachineLearningCVE/Friday-WorkingHours-Morning.pcap_ISCX.csv", header=T)
train_raw7 = read.csv("dataset/MachineLearningCVE/Friday-WorkingHours-Afternoon-PortScan.pcap_ISCX.csv", header=T)
train_raw8 = read.csv("dataset/MachineLearningCVE/Friday-WorkingHours-Afternoon-DDos.pcap_ISCX.csv", header=T)
train_raw = rbind(train_raw1, train_raw2, train_raw3, train_raw4, train_raw5, train_raw6, train_raw7, train_raw8)

d = dim(train_raw)

# Observe the data
names(train_raw)





# Observe the distribution of labels
sum_label <- aggregate(rep(1, d[1]), by = list(train_raw$Label), FUN = sum)
names(sum_label) <- c("label", "count")
barplot(beside = TRUE, (sum_label$count), 
        names.arg = sum_label$label, ylim = c(0,max(sum_label$count)),
        xlab = "Label", ylab = "Count",
        col = "Blue", main = "The distribution of labels")

# print the distribution in numbers
print(sum_label)


# save the full dataset
#write.csv(train_raw, file = "CIC2017_Full.csv")




library("caret")

inTrain <- createDataPartition(y = train_raw$Label, p = 0.2, list = FALSE)
inTest <- createDataPartition(y = train_raw$Label, p = 0.2, list = FALSE)
testing_subset_train <- train_raw[inTrain,]
testing_subset_test <- train_raw[inTest,]

# save the subset dataset of training and testing
write.csv(testing_subset_train, file = "CIC2017_subset_train.csv")
write.csv(testing_subset_test, file = "CIC2017_subset_test.csv")

d = dim(testing_subset_train)



# Observe the distribution of new subset labels
# rm(sum_label)
# sum_label <- aggregate(rep(1, d[1]), by = list(testing_subset_train$Label), FUN = sum)
# names(sum_label) <- c("label", "count")
# barplot(beside = TRUE, (sum_label$count), 
#         names.arg = sum_label$label, ylim = c(0,max(sum_label$count)),
#         xlab = "Label", ylab = "Count",
#         col = "Blue", main = "The distribution of labels")
# 
# # print the distribution in numbers
# print(sum_label)
