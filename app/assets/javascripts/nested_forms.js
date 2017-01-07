$(document).ready(function() {
    var nestedForm;

  if ($('.duplicatable_nested_form').length) {
    nestedForm = $('.duplicatable_nested_form').last().clone();
    $(".destroy_duplicate_nested_form:first").remove();
    $('body').on('click', '.destroy_duplicate_nested_form', function(e) {
      return $(this).closest('.duplicatable_nested_form').slideUp().remove();
    });

    return $('.duplicate_nested_form').click(function(e) {
      var formsOnPage, lastNestedForm, newNestedForm;
      e.preventDefault();

      lastNestedForm = $('.duplicatable_nested_form').last();
      newNestedForm = $(nestedForm).clone();
      formsOnPage = $('.duplicatable_nested_form').length;

      newNestedForm.children().each(function( index ) {
        test = $( this ).children().get(1);
        if (test != undefined) {
          oldId = test.getAttribute('id');
          newId = oldId.replace(new RegExp(/_[0-9]+_/), "_"+ formsOnPage +"_")
          oldName = test.getAttribute('name');
          newName = oldName.replace(new RegExp(/\[[0-9]+\]/), "["+ formsOnPage +"]")
          test.setAttribute('id', newId);
          test.setAttribute('name', newName);
        }
      });

      return $(newNestedForm).insertAfter(lastNestedForm);
    });

  }
});
