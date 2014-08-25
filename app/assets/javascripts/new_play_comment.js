$(function(){
  $("#new_play_comments").on("click", ".new_play_comment", function(){
    var button = $("#new_play_comments").children($("button"));
    var form = $("<form id='play_comment_form'>");
    var input = $("<textarea id='input_play_comment' type='text'>");
    var commentableTypeField = $("<input type='hidden' id='commentable_type' value='Play'>");
    var commentableId = location.pathname.replace(/\/teams\/\d*\/plays\//, "");
    var commentableIdField = $("<input type='hidden' id='commentable_id' value='" + commentableId + "'>");
    var submitButton = $('<input id="submit_play_comment" name="commit" type="submit" value="Add comment">');

    form.append(commentableTypeField);
    form.append(commentableIdField);
    form.append(input);
    button.replaceWith(form);
    input.after(submitButton);
  });

  $("#new_play_comments").on("submit", $("#submit_play_comment"), function(){
    var commentInput = $("#input_play_comment").val();
    var commentableId = $("#commentable_id").val();
    var commentableType = $("#commentable_type").val();

    $.ajax({
      url: location.pathname + "/play_comments",
      type: "POST",
      data: { comment: { body: commentInput, commentable_id: commentableId, commentable_type: commentableType } }
    });
    return false;
  });
});
