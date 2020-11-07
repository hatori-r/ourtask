$(function() {
  // -----flash_message(new)-----
  // クリックで発火
  $(function() {
    $('.notice').click(function() {
      $('.notice').slideUp(500);
    });
  });
  
  // 5秒後に自動発火
  $(function() {
    setTimeout(function() {
    $('.notice').slideUp();
  }, 5000);
});
// -------------------------------
  // -----flash_message(guest)-----
  // クリックで発火
  $(function() {
    $('.guest_alert').click(function() {
      $('.guest_alert').slideUp(500);
    });
  });
// -------------------------------

  $(function() {
    $(".tab a").click(function() {
      $(this).parent().addClass("active").siblings(".active").removeClass("active");
      var tabContents = $(this).attr("href");
      $(tabContents).addClass("active").siblings(".active").removeClass("active");
      return false;
    });
  });
})