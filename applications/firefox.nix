{
  programs.firefox = {
    enable = true;
    languagePacks = [ "ja" ];
    preferences = {
      "browser.contentblocking.category" = "strict";
      "browser.discovery.enabled" = false;
      "browser.tabs.closeWindowWithLastTab" = false;
      "browser.urlbar.placeholderName" = "DuckDuckGo";
      #"intl.locale.requested" = "ja,en-US";
      "network.trr.mode" = 3;
      "network.trr.uri" = "https://main.adguard.syobon.net/dns-query";
      "network.trr.custom_uri" = "https://main.adguard.syobon.net/dns-query";
      "network.trr.bootstrapAddress" = "1.1.1.1";
      "privacy.donottrackheader.enabled" = true;
      "signon.rememberSignons" = false;
    };
  };
}
