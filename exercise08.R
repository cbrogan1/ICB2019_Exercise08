#exercise 8 - Cailey Brogan
#number 1

scores=read.table("UWvMSU_1-22-13.txt", sep='\t', header=T)
head(scores)
scores=as.data.frame(scores)

# create data frame with cumulative scores (51 rows because time starts at zero)
df <- data.frame(matrix(ncol=3, nrow=51))
x  <- c("time", "UW", "MSU")               
colnames(df) <- x
df[1,] = 0

# for loop to find cumulative scores
for(i in 2:nrow(df)) {
  df$time[i]=scores$time[i-1]
  if(scores$team[i-1]=="UW") {
    df[i,2] <- (df[i-1,2] + scores[i-1, 3])
    df[i,3] <- df[i-1,3]
  }else{
    df[i,3] <- (df[i-1,3] + scores[i-1, 3])
    df[i,2] <- df[i-1,2]
  }
}

# plot
plot(df$time, df$UW, type='l', xlab = "Time", ylab = "Score", main = "UW (blue) vs MSU (black) Scores vs Time", col = "blue")
lines(df$time, df$MSU)


#----------------------------------------------------------------------------------------#
#number 2  
  
  