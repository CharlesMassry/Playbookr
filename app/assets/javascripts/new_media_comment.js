$(function(){
  $(".medium").on("click", ".new_media_comment", function(){
    var button = $(this);
    var commentableId = button.attr("data");
    dynamicFormFor(button, commentableId, "medium", "Add comment");
  });

  $(".medium").on("click", "form", function(){
    submitComment($(this));
    return false;
  });
});
