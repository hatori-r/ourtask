$(function() {
  $('.remove-comment').hide()
  $('.a-comment').click(function() {
    $(this).next(".remove-comment").slideToggle("fast");
  });
});