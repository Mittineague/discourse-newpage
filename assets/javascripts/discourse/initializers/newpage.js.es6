import { withPluginApi } from 'discourse/lib/plugin-api';

function oldCode() {
  // migrate your old plugin code here. It will only be run if no PluginAPI  is present
//  console.log("in old code initializer block");
}

function initializePlugin(api, siteSettings) {
  if (siteSettings.mitt_newpage_enabled) {
    api.decorateWidget("hamburger-menu:generalLinks", () => {
      return { route: 'newpage', label: 'newpage.title' };
    });
  }
}

export default {
  name: 'discourse-newpage',
  initialize(container) {
    const siteSettings = container.lookup('site-settings:main');
    withPluginApi('0.1', api => initializePlugin(api, siteSettings), { noApi: () => oldCode() });
  }
}