$(document).ready(function(){
  onlyRead();
  onlyUnread();
  all();
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

var all = function(){
  $('.all').on("click", function(e) {
    toggleDisplay("unread", "read");
  });
};

var toggleDisplay = function(value, secondValue) {
  var table = $('tbody')[0];
  var links = table.children;
  for (var i = 0; i < links.length; i++) {
    var link = links[i];
    if (link.id === value || secondValue) {
      link.style.display = "initial";
    } else {
      link.style.display = "none";
    }
  }
};
