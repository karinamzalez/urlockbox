$(document).ready(function () {
  createLink();
});

var createLink = function() {
  $("#create-link").on("click", function(e) {
    var title = $("#title").val();
    var url = $("#url").val();
    $.ajax({
      method: "POST",
      url: "/api/v1/links",
      data: {link: {title: title, url: url}},
      dataType: "json",
      success: function(link) {
        clearTextFileds();
      }
    });
  });
};

function clearTextFileds() {
  $('#title').val('');
  $('#url').val('');
}
