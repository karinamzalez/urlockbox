$(document).ready(function () {
  createIdea();
});

var createIdea = function() {
  $("#create-id").on("click", function(e) {
    var title = $("#title").val();
    var url = $("#url").val();
    $.ajax({
      method: "POST",
      url: "/api/v1/ideas",
      data: {idea: {title: title, body: body}},
      dataType: "json",
      success: function(idea) {
        appendIdea(idea);
        clearTextFileds();
        deleteIdea();
        upvoteQuality();
        downvoteQuality();
      }
    });
  });
};

function clearTextFileds() {
  $('#title').val('');
  $('#body').val('');
}
