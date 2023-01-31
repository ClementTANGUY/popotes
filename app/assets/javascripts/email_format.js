$(document).ready(function() {
  function isValidEmailFormat(email) {
  var pattern = /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i;
  return pattern.test(email);
  }
  var formInput = $("#email_format").parents('.form-inputs');

  $("#email_format").on("keyup", function() {
    var emailFormat = $("#email_format").val();

    if (isValidEmailFormat(emailFormat)) {
      $("#email-tips").text("OK !");
      formInput.removeClass("has-warning").addClass("has-success");
      $("#email-tips").removeClass("orange").addClass("green");
    } else {
      $("#email-tips").text("C'est presque ça...");
      formInput.removeClass("has-success").addClass("has-warning");
      $("#email-tips").removeClass("green").addClass("orange");
    }
  });

  $("#email_format").on("focus", function() {
  $("#email-tips").text("Vérifiez bien votre adresse email !");
  $("#email-tips").addClass("orange");
  });

  $("#email_format").on("blur", function() {
  $("#email-tips").text("");
  formInput.removeClass("has-warning").removeClass("has-success");
  $("#email-tips").removeClass("orange").removeClass("green");
  });

})
