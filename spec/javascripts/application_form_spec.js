//= require jquery
//= require application_form

describe("application_form", function() {

  describe("#getCurrentPage", function() {
    beforeEach(function() {
      Form.init();
      });

  it("returns returns the current page", function() {


    expect(Form.getCurrentPage.toEqual(0));
  });
});


  it("returns the previous page", function() {
    var page = Form.current_page
    var page_1 = page.prevPage

    expect(page_1.toBeLessThan(page));
  });

  it("returns the next page", function() {
    var page = Form.current_page
    var page_1 = page.nextPage

    expect(page_1.toBeMoreThan(page));
  });

});




