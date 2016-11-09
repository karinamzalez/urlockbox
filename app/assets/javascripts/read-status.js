$(document).ready(function(){
  markAsRead();
  // markAsUnread();
});

var markAsRead = function() {
  $(".read").on("click", function(e) {
    var button = e.target;
    console.log(button);
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
