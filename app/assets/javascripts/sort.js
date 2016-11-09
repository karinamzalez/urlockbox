/*jshint esversion: 6 */
$(document).ready(function(){
  onlyRead();
});

var onlyRead = function() {
  $.ajax({
    method: "GET",
    url: "/api/v1/links/read-links",
    data: {read: "t"},
    dataType: "json",
    success: function(links) {
      var linksTable = $('.links')[0];
      // debugger
      while (linksTable.hasChildNodes()) {
        linksTable.removeChild(linksTable.firstChild);
      }
      // links.forEach(function(link) {
      //   linksTable.appendChild("<div>")
      // });
    }
  });
};
