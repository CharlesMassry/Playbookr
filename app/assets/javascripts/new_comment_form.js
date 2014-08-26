function capitalize(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

function dynamicFormFor(button, commentableId, type, buttonText) {
  var form = $("<form id='" + type + "_comment_form_" + commentableId + "'>");
  var input = $("<textarea name='comment[body]' id='input_" + type + "_comment' type='text'>");
  var commentableTypeField = $("<input type='hidden' name='comment[commentable_type]' id='commentable_type' value='"+ capitalize(type) +"'>");
  var commentableIdField = $("<input type='hidden' name='comment[commentable_id]' id='commentable_id' value='" + commentableId + "'>");
  var submitButton = $("<input id='submit_"+ type +"_comment' class='" + type +"_comment' name='commit' type='submit' value='" + buttonText + "'>");

  form.append(commentableTypeField);
  form.append(commentableIdField);
  form.append(input);
  button.replaceWith(form);
  input.after(submitButton);
}
