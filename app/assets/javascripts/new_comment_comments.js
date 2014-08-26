$(function(){
  $(".comment").on("click", ".reply_form_trigger", function(){
    var button = $(this);
    var commentableId = button.attr("data");
    dynamicFormFor(button, commentableId, "comment", "Reply");
    $("#submit_comment_comment").addClass("reply");
  });

  $(".comment").on("submit", $("#submit_comment_comment"), function(){
    var commentParams = $(this).find("form").serialize();

    $.post( location.pathname + "/comment_comments", commentParams);
    return false;
  });
});
