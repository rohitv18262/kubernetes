import os

file1 = open("mongo-db-sample-log.txt", "r+")


substring = "command"
with open('/home/rohit/Documents/marrow-interview/kubernetes/mongo-db-sample-log.txt','r') as file:
 
    for line in file:
        if substring in line:

            word_list = line.split() 

            time_taken = word_list[-1] 
            time_taken = time_taken[:-2]

            time_taken_in_sec = int(time_taken) / 1000
            # print(time_taken_in_sec)
            if time_taken_in_sec >= 60:
                print(line,"time taken in sec",time_taken_in_sec)

            