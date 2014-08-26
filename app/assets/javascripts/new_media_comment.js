$(function(){
  $("#media").on("click", ".new_media_comment", function(){
    var button = $(this);
    var commentableId = button.attr("data");
    dynamicFormFor(button, commentableId, "medium", "Add comment");
  });

  $(".medium").on("submit", $("#submit_medium_comment"), function(){
    var commentParams = $(this).find("form").serialize();

    $.post( location.pathname + "/medium_comments", commentParams);
    return false;
  });
});
