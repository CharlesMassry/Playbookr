$(function(){
  $(".play").on("click", ".new_play_comment", function(){
    var button = $(this);
    var commentableId = location.pathname.replace(/\/teams\/\d*\/plays\//, "");
    dynamicFormFor(button, commentableId, "play", "Add comment");
  });

  $(".play").on("submit", "form", function(){
    submitComment($(this));
    return false;
  });
});
