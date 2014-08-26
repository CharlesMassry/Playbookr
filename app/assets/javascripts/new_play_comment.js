$(function(){
  $("#new_play_comments").on("click", ".new_play_comment", function(){
    var button = $(this);
    var commentableId = location.pathname.replace(/\/teams\/\d*\/plays\//, "");
    dynamicFormFor(button, commentableId, "play", "Add comment");
  });

  $("#play_comments").on("submit", $("#submit_play_comment"), function(){
    var commentParams = $(this).find("form").serialize();

    $.post( location.pathname + "/play_comments", commentParams);
    return false;
  });
});
