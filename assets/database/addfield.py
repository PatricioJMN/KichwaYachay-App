import json

jsonfilename = 'unity_1_lesson_2.json'

# Read the JSON data from the file
with open(jsonfilename, 'r', encoding='utf-8') as f:
    data = json.load(f)

# Add the new field to each item in the data
for item in data:
    item['optionList'] = [item['correctAnswer'], ]

# Write the updated data back to the file
with open(jsonfilename, 'w', encoding='utf-8') as f:
    json.dump(data, f, indent=4)