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
        $(newNestedForm).find('label').each(function() {
          var newLabel, oldLabel;
          oldLabel = $(this).attr('for');
          newLabel = oldLabel.replace(new RegExp(/_[0-9]+_/), "_" + formsOnPage + "_");
          return $(this).attr('for', newLabel);
        });
        $(newNestedForm).find('select, input').each(function() {
          var newId, newName, oldId, oldName;
          oldId = $(this).attr('id');
          newId = oldId.replace(new RegExp(/_[0-9]+_/), "_" + formsOnPage + "_");
          $(this).attr('id', newId);
          oldName = $(this).attr('name');
          newName = oldName.replace(new RegExp(/\[[0-9]+\]/), "[" + formsOnPage + "]");
          return $(this).attr('name', newName);
        });
        return $(newNestedForm).insertAfter(lastNestedForm);
      });
    }
  });
