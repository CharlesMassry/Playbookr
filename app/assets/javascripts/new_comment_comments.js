$(function(){
  $(".comment").on("click", ".reply_form_trigger", function(){
    var button = $(this);
    var commentableId = button.attr("data");
    dynamicFormFor(button, commentableId, "comment", "Reply");
    $("#submit_comment_comment").addClass("reply");
  });

  $(".comment").on("submit", "form", function(){
    submitComment($(this));
    return false;
  });
});
