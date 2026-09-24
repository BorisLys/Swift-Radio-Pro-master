// Конфигурация Allure Report 3: https://allurereport.org/docs/v3/configure/
// Обычный объект без `defineConfig`: в CI allure ставится глобально (npm install -g),
// и импорт пакета "allure" из репозитория не резолвится.
export default {
  name: "Swift Radio",
  output: "./allure-report",
  // История запусков (JSONL, одна строка на запуск). В CI файл берётся из ветки gh-pages
  // перед генерацией и публикуется обратно вместе с отчётом.
  historyPath: "./allure-history/history.jsonl",
  plugins: {
    awesome: {
      options: {
        reportName: "Swift Radio",
        reportLanguage: "ru",
        singleFile: false,
        groupBy: ["epic", "feature", "story"],
      },
    },
  },
};
