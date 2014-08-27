$(function(){
  $(".comment").on("click", ".new_comment_comment", function(){
    var button = $(this);
    dynamicFormFor(button, "comment");
  });

  $(".comment").on("submit", "form", submitComment);
});
