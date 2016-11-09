$(document).ready(function () {
  filterTitle();
});

var filterTitle = function() {
  var $links = $('.links');
  $('#link_filter_title').on("keyup", function(){
    console.log(this.value);
    var currentTitle = this.value;
    $links.each(function (index, link){
      $link = $(link);
      if ($link.data('title').indexOf(currentTitle) !== -1 ) {
        $link.show();
      } else {
        $link.hide();
      }
    });
  });
};
