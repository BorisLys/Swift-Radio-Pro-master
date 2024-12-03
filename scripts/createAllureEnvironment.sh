OUTPUT_FILE="allure-results/environment.properties"

# Создание и заполнение файла
echo "release_version = $MARKETING_VERSION" > $OUTPUT_FILE
echo "build_version = $BUILD_VERSION" >> $OUTPUT_FILE
echo "os_version = $SIMULATOR_VERSION" >> $OUTPUT_FILE
echo "simulator_model = $SIMULATOR_NAME" >> $OUTPUT_FILE
echo "allure_version = $ALLURE_VERSION" >> $OUTPUT_FILE

# Вывод результата
echo "Файл $OUTPUT_FILE успешно создан:"
cat $OUTPUT_FILE
