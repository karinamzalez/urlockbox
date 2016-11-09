$(document).ready(function () {
  filterTitle();
});

var filterTitle = function() {
  $('#link_filter_title').on("keyup", function(){
    var currentTitle = this.value;
    var table = $('tbody')[0];
    var links = table.children;
    $.each(links, function (index, link){
      if (link.getAttribute('data-title').indexOf(currentTitle) !== -1 ) {
        link.style.display = "initial";
      } else {
        link.style.display = "none";
      }
    });
  });
};
