$(function(){
  $(".comment_delete").on("click", function(){
    var id = $(this).data("comment-id");
    $.ajax({
      url: location.pathname + "/comments/" + id,
      type: "DELETE",
      success: function(){
        $("#comment_"+ id).fadeOut();
      }
    });
  });
});
