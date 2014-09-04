$(function(){
  $(".media_delete").on("click", function(){
    var id = $(this).data("id");
    $.ajax({
      url: location.pathname + "/media/" + id,
      type: "DELETE",
      success: function(){
        $("#medium_" + id).fadeOut();
      }
    });
  });
});
