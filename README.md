# YieldMo Data Questions

    $ git clone https://github.com/anaqvi2/yieldmo_R_work
    $ cd yieldmo_R_work

Question 1
Input is an array of two sets, please seperate with spaces I will group them myself

    $ Rscript yieldmo_q1.R 1 2 10 12 18 20 21 23 24 27 29 33
     [1] "Start Time: 1 & End Time: 2"
     [1] "Start Time: 10 & End Time: 12"
     [1] "Start Time: 18 & End Time: 33"
           start_time end_time
     1          1        2
     2         10       12
     3         18       33

Question 2

Input is the file path for the english word dictionary and the number to match against . 
0 -> A, B or C
1 -> D, E or F
5 -> Q, R, S, T

    $ Rscript yieldmo_q2.R yieldmo_sample_words.csv 015
     [1] "adroit"               "adroitly"             "best"
     [4] "best known"           "best performing"      "best selling"
     [7] "better"               "better known"         "better than expected"
