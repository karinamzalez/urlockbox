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
      success: function(link) {
        updateHtml(link);
        updateButton(link);
        lineThrough(link);
      }
    });
  });
};

var updateHtml = function(link) {
  var readTd = $(`.read_${link.id}`)[0];
  if (link.read === "t") {
    readTd.innerText = "true";
  } else {
    readTd.innerText = "false";
  }
};

var updateButton = function(link) {
  var readBtn = $(`#btn_${link.id}`)[0];
  if (link.read === "t") {
    readBtn.innerText = "Mark As Unread";
  } else {
    readBtn.innerText = "Mark As Read";
  }
};

var lineThrough = function(link) {
  if (link.read === "f") {
    $(`.tr_${link.id}`).css({"text-decoration": "initial"});
  } else {
    $(`.tr_${link.id}`).css({"text-decoration": "line-through"});
  }
};
