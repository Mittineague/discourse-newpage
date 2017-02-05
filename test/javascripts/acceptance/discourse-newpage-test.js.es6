import { acceptance } from "helpers/qunit-helpers";

acceptance("Discourse Newpage", {
  loggedIn: true,
  settings: { mitt_newpage_enabled: true },
  currentUser: "TestRunner",
  setup() {
    const response = (object) => {
      return [
        200,
        {"Content-Type": "application/json"},
        object
      ];
    }
    server.get('/newpage', () => {
      return response({ valid: [] });
    })
  }
});

test("Newpage Page", () => {

  visit("/newpage");

  andThen(() => {
    ok(find("h1.mitt_newpage"), 'the heading was found');
    ok(find("h1.mitt_newpage:contains('Welcome')"), 'heading displays Welcome');
    ok(find("h1.mitt_newpage:contains('TestRunner')"), 'heading displays TestRunner');

    ok(find("ul.mitt_newpage"), 'the list was found');
    ok(find("ul.mitt_newpage li:contains('system')"), 'list displays system');
    ok(find("ul.mitt_newpage li:contains('PaddingtonBrown TL 7')"), 'list displays PaddingtonBrown TL 7');

    ok(find("div.mitt_div"), 'custom footer was found');
  });

  click('#toggle-hamburger-menu');

  andThen(() => {
    ok(find(".hamburger-panel div ul li a[href='/newpage']"), 'hamburger menu has link');
    strictEqual(find(".hamburger-panel div ul li a[href='/newpage']").attr('title'), 'Newpage', 'hamburger menu link has title');
    strictEqual(find(".hamburger-panel div ul li a[href='/newpage']").text().trim(), 'Newpage', 'hamburger menu has link text');
  });

});