//= require jquery
//= require jquery_ujs

$(function() {
  $('input:submit.upload').attr('disabled', true);
  $('input:file').change(function(){
    if ($(this).val()){
      $('input:submit.upload').removeAttr('disabled');
    } else {
      $('input:submit.upload').attr('disabled', true);
    }
  });
});
