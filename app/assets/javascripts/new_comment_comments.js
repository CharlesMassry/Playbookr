$(function(){
  $(".comment").on("click", ".reply_form_trigger", function(){
    var button = $(this);
    var commentId = button.attr("data");
    var form = $("<form id='comment_comment_form_" + commentId + "'>");
    var input = $("<textarea name='body' id='input_comment_comment' type='text'>");
    var commentableTypeField = $("<input type='hidden' name='commentable_type' id='commentable_type' value='Comment'>");
    var commentableIdField = $("<input type='hidden' name='commentable_id' id='commentable_id' value='" + commentId + "'>");
    var submitButton = $("<input id='submit_comment_comment' class='reply' name='commit' type='submit' value='Reply'>");

    form.append(commentableTypeField);
    form.append(commentableIdField);
    form.append(input);
    button.replaceWith(form);
    input.after(submitButton);
  });

  $(".comment").on("submit", $("#submit_comment_comment"), function(){
    var commentInput = $("#input_comment_comment").val();
    var commentableId = $("#commentable_id").val();
    var commentableType = $("#commentable_type").val();

    $.post( location.pathname + "/comment_comments",
           { comment: { body: commentInput, commentable_id:commentableId, commentable_type: commentableType }
    });
    return false;
  });
});
