
import subprocess
import csv
import pandas as pd
cmd = ['df', '-h']

lsProcess = subprocess.Popen(cmd, stdout=subprocess.PIPE)
output , error= lsProcess.communicate()
# print(output)
# print(type(output))
output_str = output.decode('utf-8') 
lines = output_str.splitlines()
# print(lines,"lines",type(lines))

data = []
for i in lines: 
    i = i.split()
    data.append(i)

# print(data)

csv_file = "df_output.csv"
with open("df_output.csv",'w',newline='') as file:
    write = csv.writer(file)
     
    write.writerows(data)

df = pd.read_csv("df_output.csv")


df['Use%'] = df['Use%'].str.rstrip('%').astype(int)

result = df[df['Use%'] >= 18]

if not result.empty:
    print(result)
else:
    print("No rows have Use% >= 75.")
     

