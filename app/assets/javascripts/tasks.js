$(function() {
  // -----flash_message(new)-----
  // クリックで発火
  $(function() {
    $('.new_task').click(function() {
      $('.new_task').slideUp(500);
    });
  });
  
  // 5秒後に自動発火
  $(function() {
    setTimeout(function() {
      $('.new_task').slideUp();
    }, 5000);
  });
  // -------------------------------
  
  
  // -----flash_message(update)-----
  // クリックで発火
  $(function() {
    $('.update_task').click(function() {
      $('.update_task').slideUp(500);
    });
  });
  
  // 5秒後に自動発火
  $(function() {
    setTimeout(function() {
      $('.update_task').slideUp();
    }, 5000);
  });
  // -------------------------------
  
  
  // -----flash_message(update)-----
  // クリックで発火
  $(function() {
    $('.delete_task').click(function() {
      $('.delete_task').slideUp(500);
    });
  });
  
  // 5秒後に自動発火
  $(function() {
    setTimeout(function() {
      $('.delete_task').slideUp();
    }, 5000);
  });
  // -------------------------------
  
  // -----ページの先頭へボタン-----
  $(function() {
    var topBtn = $('#page-top');    
    topBtn.hide();
    //スクロールが100に達したらボタン表示
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            topBtn.fadeIn("fast");
        } else {
            topBtn.fadeOut("fast");
        }
    });
    //スクロールしてトップ
    topBtn.click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 500);
        return false;
    });
});
$(function() {
  $("#page-top").hover(function() {
    $("#slide-text").slideToggle("fast");
  });
});
// -------------------------------

// -----タスク投稿ボタン-----
  $(function() {
    var topBtn = $('#appear-share-task');    
    topBtn.hide();
    //スクロールが100に達したらボタン表示
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            topBtn.fadeIn("fast");
        } else {
            topBtn.fadeOut("fast");
        }
    });
  });
  $(function() {
    $("#appear-share-task").hover(function() {
      sethover = setTimeout(function() {
        $("#appear-info").fadeIn("fast")
      },500);
    }, function() {
      $("#appear-info").fadeOut("fast")
      clearTimeout(sethover);
    });
  });
  // -------------------------------

// -----かんたんログインボタン-----
  $(function() {
    var topBtn = $('#appear');    
    topBtn.hide();
    //スクロールが100に達したらボタン表示
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            topBtn.slideDown("fast");
        } else {
            topBtn.slideUp(500);
        }
    });
  });
  // -------------------------------
})