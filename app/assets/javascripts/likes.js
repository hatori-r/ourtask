$(function() {
  // -----flash_message(good_task)-----
  // クリックで発火
  $(function() {
  $('.good_task').click(function() {
    $('.good_task').slideUp(500);
  });
});

// 5秒後に自動発火
$(function() {
  setTimeout(function() {
    $('.good_task').slideUp();
  }, 5000);
});
// -------------------------------

// -----flash_message(cancel_good)-----
// クリックで発火
$(function() {
  $('.cancel_good').click(function() {
    $('.cancel_good').slideUp(500);
  });
});

// 5秒後に自動発火
$(function() {
  setTimeout(function() {
    $('.cancel_good').slideUp();
  }, 5000);
});
// -------------------------------
})