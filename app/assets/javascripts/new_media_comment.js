$(function(){
  $("#media").on("click", ".new_media_comment", function(){
    var button = $(this);
    var mediumId = button.attr("data");
    var form = $("<form id='medium_comment_form_" + mediumId + "'>");
    var input = $("<textarea name='body' id='input_medium_comment' type='text'>");
    var commentableTypeField = $("<input name='commentable_type' type='hidden' id='commentable_type' value='Medium'>");
    var commentableIdField = $("<input name='commentable_id' type='hidden' id='commentable_id' value='" + mediumId + "'>");
    var submitButton = $('<input id="submit_medium_comment" name="commit" type="submit" value="Add comment">');

    form.append(commentableTypeField);
    form.append(commentableIdField);
    form.append(input);
    button.replaceWith(form);
    input.after(submitButton);
  });

  $("#media").on("submit", $("#submit_medium_comment"), function(){
    var commentInput = $("#input_medium_comment").val();
    var commentableId = $("#commentable_id").val();
    var commentableType = $("#commentable_type").val();

    $.post( location.pathname + "/medium_comments",
           { comment: { body: commentInput, commentable_id:commentableId, commentable_type: commentableType }
    });
    return false;
  });
});
