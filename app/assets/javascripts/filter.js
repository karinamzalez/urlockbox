$(document).ready(function () {
  filterTitle();
  filterUrl();
});

var filterTitle = function() {
  $('#link_filter_title').on("keyup", function(){
    var currentTitle = this.value;
    filter("data-title", currentTitle);
  });
};

var filterUrl = function() {
  $('#link_filter_url').on("keyup", function(){
    var currentUrl = this.value;
    filter("data-url", currentUrl);
  });
};

var filter = function(data, currentQuery) {
  var table = $('tbody')[0];
  var links = table.children;
  $.each(links, function (index, link){
    if (link.getAttribute(data).indexOf(currentQuery) !== -1 ) {
      link.style.display = "initial";
    } else {
      link.style.display = "none";
    }
  });
};
