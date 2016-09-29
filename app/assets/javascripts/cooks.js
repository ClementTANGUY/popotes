// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function () {


  $('.expiration-date').countdown("10/05/2016 12:00:00")
  .on('update.countdown', function(event) {
    var format = '%H hr %M min %S';
    if(event.offset.totalDays > 0) {
      format = '%-d jour%!d ' + format;
    }
    if(event.offset.weeks > 0) {
      format = '%-w week%!w ' + format;
    }
    $(this).html(event.strftime(format));
  })
  .on('finish.countdown', function(event) {
    $(this).html('Trop tard, offre expirée !')
      .parent().addClass('disabled');

  });
});
