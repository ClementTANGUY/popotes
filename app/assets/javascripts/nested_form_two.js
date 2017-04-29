$(document).ready(function() {

  var nestedForm;
  nestedForm = $('.duplicatable_nested_form_two').last().clone();

  $('.duplicatable_nested_form_two').find('.destroy_duplicate_nested_form_two').remove();

  $('body').on('click', '.destroy_duplicate_nested_form_two', function(e) {
    $(this).closest('.duplicatable_nested_form_two').slideUp().remove();
    $('.form-actions').find('.duplicate_nested_form_two').show();
  });

  $('.duplicate_nested_form_two').click(function(e) {
    var formsOnPage, lastNestedForm, newNestedForm;
    e.preventDefault();
    lastNestedForm = $('.duplicatable_nested_form_two').last();
    newNestedForm = $(nestedForm).clone();
    formsOnPage = $('.duplicatable_nested_form_two').length;
    if ((formsOnPage == 1 && $(newNestedForm).length == 2) || (formsOnPage == 2 && $(newNestedForm).length == 1)) {
      $('.form-actions').find('.duplicate_nested_form_two').hide()
    };

    newNestedForm.children().each(function(index) {
      element = $(this).children().get(1);
      if (element != undefined) {
        oldId = element.getAttribute('id');
        newId = oldId.replace(new RegExp(/_[0-9]+_/), "_"+ formsOnPage +"_")
        oldName = element.getAttribute('name');
        newName = oldName.replace(new RegExp(/\[[0-9]+\]/), "["+ formsOnPage +"]")
        element.setAttribute('id', newId);
        element.setAttribute('name', newName);
      }
    });

    $(newNestedForm).find('input:text').val("")
    $(newNestedForm).find('select option:selected').removeAttr('selected')
    $(newNestedForm).find('input:checkbox').removeAttr('checked');

    $(newNestedForm).insertAfter(lastNestedForm);
  });

});
