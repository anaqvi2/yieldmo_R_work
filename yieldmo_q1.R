args <- commandArgs(trailingOnly = TRUE)
args <- as.numeric(args)

#args<-c(1,8,10,12,18,20,5,7,24,27,29,33)

df<-data.frame(startTime = args[seq(1, length(args), 2)], endTime= args[seq(2, length(args), 2)])

diff_times<-0

for(i in 2:nrow(df)){
  diff_times<-c(diff_times, df$startTime[i]-df$endTime[i-1])
}

df$diff<-diff_times

start_time<-df$startTime[1]
df_dict<-data.frame(start_time=numeric(), end_time=numeric())
for(i in 1:nrow(df)){
  if((df$diff[i]>5) | (i==nrow(df))){
    end_time<-df$endTime[i-1]
    if(i==(nrow(df))){
      end_time<-df$endTime[i]
    }
    print(paste0("Start Time: ", start_time, " & End Time: ", end_time))
    df_dict<-rbind(df_dict, data.frame(start_time=start_time, end_time=end_time))
    start_time<-df$startTime[i]
  }
}
print(df_dict)
