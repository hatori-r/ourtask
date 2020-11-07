$(function() {
  $(".overlay").show();
  $.cookie('btnFlg') == 'on'?$(".overlay").hide():$(".overlay").show();
  $(".btn_area button").click(function(){
    $(".overlay").fadeOut();
    $.cookie('btnFlg', 'on', { expires: 30,path: '/' });
  });
});