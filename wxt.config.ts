import { defineConfig } from "wxt";

export default defineConfig({
  modules: ["@wxt-dev/auto-icons"],
  imports: false,
  zip: {
    artifactTemplate: "firefox.xpi",
  },
  manifest: {
    permissions: ["nativeMessaging"],
    key: "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2CZb7X2rhUMabTyQiWpKcO+lDWYluI2iqWwvom5hI7UCOc9+o72J7k4t2zs42KubxytqDGknrqVAPuAAVPFaxZQKfoSmw67n4p+gNK3JAD56g439qv5DpDFS2ji9THXez368yec5ARZwU1uEnOHR+BfNJjvdVfKeLCsVPX7aLmYOPt2m5asjShPL4NbR/gK3uTwC6sAyN1PsJfrisVqvmab6ITv1C3wGu/z0ePuLIsgzI8bANlKppVunPsE6RMyE1eOfQd+OhYZUQydZ4BP+9YhNfae31PaiHPQQHTTJnRDPcsqNngPtzqMAln5GgR750hXukmq0mgdt4D25rXVE5QIDAQAB",
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
