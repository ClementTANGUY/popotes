<!-- Custom JS code to bind to Autocomplete API -->
$(document).ready(function() {

  if ($('.duplicatable_nested_form_two').length) {
    $.each($('.duplicatable_nested_form_two'), function(index) {
      var cook_address = $('.cook_address').get(index);
      var cook_zip_code = $('.cook_zip_code').get(index);
      var cook_city = $('.cook_city').get(index);

      var autocomplete = new google.maps.places.Autocomplete(cook_address, { types: ['geocode'], componentRestrictions: {country: 'fr'} });

      google.maps.event.addListener(autocomplete, 'place_changed', function () {
        var place = this.getPlace();
        var components = getAddressComponents(place);
        $(cook_address).trigger('blur').val(components.full_address);
        $(cook_zip_code).val(components.zip_code);
        $(cook_city).val(components.city);
      });

      google.maps.event.addDomListener(cook_address, 'keydown', function(e) {
        if (e.keyCode == 13) {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    });
  }

});

function getAddressComponents(place) {
  // If you want lat/lng, you can look at:
  // - place.geometry.location.lat()
  // - place.geometry.location.lng()
  var street_number = null;
  var route = null;
  var zip_code = null;
  var city = null;
  var country_code = null;
  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      var type = component.types[j];
      if (type == 'street_number') {
        street_number = component.long_name;
      } else if (type == 'route') {
        route = component.long_name;
      } else if (type == 'postal_code') {
        zip_code = component.long_name;
      } else if (type == 'locality') {
        city = component.long_name;
      }
    }
  }

  return {
    full_address: street_number == null ? route : (street_number + ' ' + route),
    zip_code: zip_code,
    city: city,
  };
}



