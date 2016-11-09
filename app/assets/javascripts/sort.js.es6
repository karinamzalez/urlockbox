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
        console.log(links);
      }
    });
  });
};

var removeCurrentLinks = function() {
  var table = $('tbody')[0];
  var links = table.children;
  $.each(links, function (index, link){
    link.style.display = "none";
  });
};

var addSortedLinks = function(links) {
  $.each(links, function(index, link){
    var html = `<tr class="tr_${ link.id }"> <td>${ link.title }</td> <td>${ link.url }</td></tr>`;
    $('tbody').append(html);
  });
};
