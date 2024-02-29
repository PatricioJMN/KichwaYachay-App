import json

with open('unity_1_lesson_3.json', 'r') as file:
    data = json.load(file)

new_data = []

for item in data:
    new_item = {
        "questionSpanish": item["question"],
        "questionKichwa": item["questionK"],
        "correctAnswer": item["traduccion"],
        "audioPath": item["audioPath"],
        "imagePath": item["imagePath"],
        "questionType": item["questionType"],
        "optionList": [item["traduccion"]]
    }
    new_data.append(new_item)

with open('archivo_modificado.json', 'w') as file:
    json.dump(new_data, file, indent=4, ensure_ascii=False)
