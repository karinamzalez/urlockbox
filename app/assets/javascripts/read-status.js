$(document).ready(function(){
  markAsRead();
  // markAsUnread();
});

var markAsRead = function() {
  $(".read").on("read", function(e) {
    var button = e.target;
    var id     = button.getAttribute('data-id');
    $.ajax({
      method: "PATCH",
      url: "/api/vi/links/mark-as-read",
      data: {id: id},
      dataType: "json",
      success: function(idea) {

      }
    });
  });
};
