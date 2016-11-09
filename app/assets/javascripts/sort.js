/*jshint esversion: 6 */
$(document).ready(function(){
  onlyRead();
  onlyUnread();
});

var onlyRead = function() {
  $(".read1").on("click", function(e) {
    toggleDisplay("read");
  });
};

var onlyUnread = function() {
  $('.unread').on("click", function(e) {
    toggleDisplay("unread");
  });
};

var toggleDisplay = function(value) {
  var table = $('tbody')[0];
  var links = table.children;
  for (var i = 0; i < links.length; i++) {
    var link = links[i];
    if (link.id === value) {
      link.style.display = "initial";
    } else {
      link.style.display = "none";
    }
  }
};
