/*jshint esversion: 6 */
$(document).ready(function(){
  toggleRead();
});

var toggleRead = function() {
  $(".read").on("click", function(e) {
    var button = e.target;
    var id = button.getAttribute('data-id');
    $.ajax({
      method: "PATCH",
      url: "/api/v1/links/mark-as-read",
      data: {id: id},
      dataType: "json",
      success: function(idea) {
        updateHtml(idea);
        updateButton(idea);
      }
    });
  });
};

var updateHtml = function(idea) {
  var readTd = $(`.read_${idea.id}`)[0];
  if (idea.read === "t") {
    readTd.innerText = "true";
  } else {
    readTd.innerText = "false";
  }
};

var updateButton = function(idea) {
  var readBtn = $(`#btn_${idea.id}`)[0];
  if (idea.read === "t") {
    readBtn.innerText = "Mark As Unread";
  } else {
    readBtn.innerText = "Mark As Read";
  }
};
