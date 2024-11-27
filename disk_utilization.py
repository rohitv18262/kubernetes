
import subprocess
import csv
import pandas as pd
import json
import requests
cmd = ['df', '-h']
slack_channel = 'https://hooks.slack.com/services/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'

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

result = df[df['Use%'] >= 75]

if not result.empty:
    print(result)
    print(type(result))
    result_string = result.to_string()
    slack_payload = {'type': 'mrkdwn', 'text': result_string}
    response = requests.post(
        slack_channel, data = json.dumps(slack_payload), headers = {'Content-Type': 'application/json'}
    )
else:
    print("No rows have Use% >= 75.")

# df -h | awk '$5+0 > 75 {print $0}'

     

