import { defineConfig } from "wxt";

export default defineConfig({
  modules: ["@wxt-dev/auto-icons"],
  imports: false,
  zip: {
    artifactTemplate: "firefox.xpi",
  },
  manifest: {
    browser_specific_settings: {
      gecko: {
        id: "{6c970293-25d9-478b-947e-9d079ede791d}",
        data_collection_permissions: {
          required: ["none"],
        },
      },
    },
  },
});
