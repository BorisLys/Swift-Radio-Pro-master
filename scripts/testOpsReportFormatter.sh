ALLURE_RESULTS=allure-results

# Удаление лишней дебаг информации из шагов
for file in "${ALLURE_RESULTS}"/*.json; do
    jq 'del(.steps[] | select((.name | startswith("Step: ") or startswith("Tear Down")) | not)) | 
        del(.steps[].steps[] | select((.name | startswith("Step: ") or startswith("Added attachment")) | not)) | 
        del(.steps[].steps[].steps[] | select((.name | startswith("Step: ")) | not))' "${file}" > changed.json
    mv changed.json "$file"
done

# Переименование шагов
for file in "${ALLURE_RESULTS}"/*.json; do
    sed -i '' 's/Step: //g; s/Tear Down/Вложения/g; s/Added attachment named/Добавлено вложение:/g' "$file"
done

# Изменение статуса из "failed" в "broken" при краше приложения
for file in "${ALLURE_RESULTS}"/*.json; do
    if grep -q '"name": "SwiftRadioUITests-Runner' "$file"; then
        sed -i '' 's/"status": "failed"/"status": "broken"/g' "$file"
    fi
done
