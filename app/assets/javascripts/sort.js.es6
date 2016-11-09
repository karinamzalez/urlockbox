/*jshint esversion: 6 */
$(document).ready(function() {
  sortAlphabetically();
});

var sortAlphabetically = function() {
  $('.alphabetical').on("click", function(){
    $.ajax({
      method: "GET",
      url: "/api/v1/links/sort-alphabetically",
      success: function(links) {
        removeCurrentLinks();
        addSortedLinks(links);
      }
    });
  });
};

var removeCurrentLinks = function() {
  $('tbody').empty();
};

var addSortedLinks = function(links) {
  $.each(links, function(index, link){
    var html = `<tr class="tr_${ link.id }"> <td>${ link.title }</td> <td>${ link.url }</td></tr>`;
    $('tbody').append(html);
  });
};
