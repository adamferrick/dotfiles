import sys
import json

for line in sys.stdin:
    emission = json.loads(line)
    if emission['reason'] == 'compiler-message' and emission['message']['spans']:
        message = emission['message']

        normal_color = '\033[0m'
        file_name = f"\033[35m{emission['message']['spans'][0]['file_name']}{normal_color}"
        line = f"\033[32m{emission['message']['spans'][0]['line_start']}{normal_color}"
        column = f"\033[32m{emission['message']['spans'][0]['column_start']}{normal_color}"
        level = emission['message']['level']
        if level == 'error':
            level = f"\033[91m{level}{normal_color}"
        else:
            level = f"\033[33m{level}{normal_color}"
        message = emission['message']['message']

        print(f'{file_name}:{line}:{column}:{level}: {message}')
