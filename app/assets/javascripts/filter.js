$(document).ready(function () {
  filterTitle();
});

var filterTitle = function() {
  $('#link_filter_title').on("keyup", function(){
    var currentTitle = this.value;
    $links = $('.link');
    $links.each(function (index, link){
      if ($link.data('title').indexOf(currentTitle) !== -1 ) {
        $link.show();
      } else {
        $link.hide();
      }
    });
  });
};
