module.exports = {
  defaultBrowser: "Google Chrome",
  handlers: [
    {
      // open Hudson Trading links in chrome "Default" profile
      match: [
        "hudson-trading.com/*",
        "*.hudson-trading.com/*",
        "hrt*/*",
        "crimson-firefly-2845.*",
        "app.kolide.com/*",
        "app.glean.com/*",
      ],
      browser: {
        name: "Google Chrome",
        profile: "Default",
      },
    },
    {
      match: ({ url }) => url.protocol === "slack",
      browser: "/Applications/Slack.app",
    },
  ],
};
