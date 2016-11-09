$(document).ready(function() {
  sortAlphabetically();
});

var sortAlphabetically = function() {
  $('.alphabetical').on("click", function(){
    $.ajax({
      method: "GET",
      url: "/api/v1/links/sort-alphabetically",
      success: function(links) {

      }
    });
  });
};
