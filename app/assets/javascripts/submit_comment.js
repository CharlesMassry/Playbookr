function submitComment(comment) {
  var commentParams = comment.serialize();
  $.post(location.pathname + "/comments", commentParams);
}
