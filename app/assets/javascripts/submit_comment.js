function submitComment() {
  var commentParams = $(this).serialize();
  $.post(location.pathname + "/comments", commentParams);
  return false;
}
