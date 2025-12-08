import { defineConfig } from "cypress";
import cypressMochawesomeReporter from "cypress-mochawesome-reporter/plugin.js";
export default defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
      cypressMochawesomeReporter(on);

    },
     reporter: "cypress-mochawesome-reporter",
      reporterOptions: {
        reportDir: "cypress/reports",
        overwrite: true,
        charts: true, // graficos en el reporte
        embedScreenshots: true, // capturas de pantalla en el reporte
        html: true, // genera reporte en HTML
        json: false, // no genera reporte en JSON
        reportPageTitle: "Pruebas Automatizadas con Cypress",
        inlineAssets: true,
      },
  },
});
