args <- commandArgs(trailingOnly = TRUE)
words<-read.csv(args[1], header=F)
#words<-data.frame(V1=qdapDictionaries::positive.words)
words$V1<-tolower(words$V1)
words$V2<-1:nrow(words)
#words$V2<-lapply(words$V1, function(x) unlist(strsplit(as.character(x), "")))

split_numb = as.numeric(unlist(strsplit(as.character(args[2]), "")))
#split_numb<-c(0,1,2)

letter_df = data.frame(numb = 0:9)
letter_array = list(c("a", "b", "c"), c("d", "e", "f"), c("g", "h", "i", "j"), 
                    c("k", "l", "m"), c("n", "o", "p"), c("q", "r", "s", "t"), 
                    c("u", "v"), c("w"), c("x", "y"), c("z"))
letter_df$letter<-letter_array

filtered_letters <- letter_df[letter_df$numb %in% split_numb,]
filtered_letters <- filtered_letters[match(split_numb, filtered_letters$numb),]$letter

for(i in 1:length(filtered_letters)){
  re<-paste0("^.{0}", paste(filtered_letters[[i]], collapse = "|^.{0}"))
  letter_number<-paste0("{", i-1, "}")
  re<-gsub("\\{0}", letter_number, re)
  words<-words[grep(re, words$V1),]
}
print(words$V1)




