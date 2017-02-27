import { acceptance, waitFor } from "helpers/qunit-helpers";

acceptance("Discourse Newpage", {
//  loggedIn: true, // sets currentUser to eviltrout
  settings: { mitt_newpage_enabled: true },
  currentUser: "TestRunner",
  setup() {
    const response = (object) => {
      return [
        200,
        {"Content-Type": "text/html; charset=utf-8"},
        object
      ];
    }
    server.get('/newpage', () => {
      return response({ valid: [] });
    })
  }
});

test("Discourse Newpage", () => {
  expect(21);

  visit("/");

  click('#toggle-hamburger-menu');

  andThen(() => {
/* added by initializer js */
    ok(exists(".hamburger-panel div ul li a[href='/newpage']"), 'hamburger menu has link');
    strictEqual(find(".hamburger-panel div ul li a[href='/newpage']").attr('title'), 'Newpage', 'hamburger menu link has title');
    strictEqual(find(".hamburger-panel div ul li a[href='/newpage']").text().trim(), 'Newpage', 'hamburger menu has link text');

    notOk(exists(".hamburger-panel div ul li a[href='/nonewpage']"), 'hamburger menu does not have non-link');
    notStrictEqual(find(".hamburger-panel div ul li a[href='/newpage']").attr('title'), 'NoSuchpage', 'hamburger menu link does not have non-title');
    notStrictEqual(find(".hamburger-panel div ul li a[href='/newpage']").text().trim(), 'NoSuchpage', 'hamburger menu does not have non-link text');
  });

  click(".hamburger-panel div ul li a[href='/newpage']");

/* TODO try to find out why QUnit is getting the nojs page. fixture? */
  andThen(() => {
/* template and handlebars */
    ok(exists("h1.mitt_newpage"), 'the heading was found');
    ok(exists("h1.mitt_newpage:contains('Welcome')"), 'heading displays Welcome');
    waitFor(() => {
/*FAILS*/
      ok(exists("h1.mitt_newpage:contains('TestRunner')"), 'heading displays TestRunner');
    }, 1000);
    notOk(exists("h1.mitt_newpage:contains('eviltrout')"), 'no undesireable eviltrout');

    notOk(exists("h1.mitt_nonewpage"), 'non-heading was not found');
    notOk(exists("h1.mitt_newpage:contains('Goodbye')"), 'heading does not display Goodbye');
    notOk(exists("h1.mitt_newpage:contains('NoSuchMemberExists')"), 'heading does not display non-user');

    ok(exists("ul.mitt_newpage"), 'the list was found');
    waitFor(() => {
/*FAILS*/
      ok(exists("ul.mitt_newpage li:contains('system')"), 'list displays system');
/*FAILS*/
      ok(exists("ul.mitt_newpage li:contains('PaddingtonBrown TL 7')"), 'list displays PaddingtonBrown TL 7');
    }, 1000);
    notEqual(find('ul.mitt_newpage').html(), '<!---->', 'no undesireable comment node');

    notOk(exists("ul.mitt_nonewpage"), 'non-list was not found');
    notOk(exists("ul.mitt_newpage li:contains('NoSuchMemberExists')"), 'list does not display non-user');
/* added by plugin.rb */
    waitFor(() => {
/*FAILS*/
      ok(exists("div.mitt_div"), 'custom footer was found');
    }, 1000);

    notOk(exists("div.mitt_nondiv"), 'non-custom footer was not found');

  });

});