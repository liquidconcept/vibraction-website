//= require jquery
//= require jquery-cycle
//= require jquery-lightbox

$(function() {
  // Cycle page therapies
  $('.testimonials').cycle({
    fx: 'fade',
    timeout: 10000,
    random: true,
    cleartypeNoBg: true
  });

  // Lightbox page tharapies
  $('#gallery a').lightBox(); // Select all links in object with gallery ID

  // Toggle content cours
  $('a.submit:not(.full)').bind('click', function(e) {
    e.stopImmediatePropagation();
    });

  $('a.submit.full').bind('click', function(e) {
    e.preventDefault();
    e.stopImmediatePropagation();
    });

  $('.more').hide();

  $('.course-box').bind('mouseenter', function() {
    $(this).find('.more:hidden').slideDown();
    }).bind('click', function() {
      $(this).find('.more:visible').slideUp();
    });
});
