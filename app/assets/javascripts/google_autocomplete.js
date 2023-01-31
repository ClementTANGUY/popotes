<!-- Custom JS code to bind to Autocomplete API -->

  function onPlaceChanged() {
    var place = this.getPlace();
    var components = getAddressComponents(place);

    var cookAddressOne = document.getElementById('cook_cook_places_attributes_0_place_attributes_full_address');
    cookAddressOne.blur();
    cookAddressOne.value = components.full_address;

    document.getElementById('cook_cook_places_attributes_0_place_attributes_zip_code').value = components.zip_code;
    document.getElementById('cook_cook_places_attributes_0_place_attributes_city').value = components.city;

    var cookAddressTwo = document.getElementById('cook_cook_places_attributes_1_place_attributes_full_address');
    cookAddressTwo.blur();
    cookAddressTwo.value = components.full_address;

    document.getElementById('cook_cook_places_attributes_1_place_attributes_zip_code').value = components.zip_code;
    document.getElementById('cook_cook_places_attributes_1_place_attributes_city').value = components.city;

    var cookAddressThree = document.getElementById('cook_cook_places_attributes_2_place_attributes_full_address');
    cookAddressThree.blur();
    cookAddressThree.value = components.full_address;

    document.getElementById('cook_cook_places_attributes_2_place_attributes_zip_code').value = components.zip_code;
    document.getElementById('cook_cook_places_attributes_2_place_attributes_city').value = components.city;

  }

  function getAddressComponents(place) {
    // If you want lat/lng, you can look at:
    // - place.geometry.location.lat()
    // - place.geometry.location.lng()

    if (window.console && typeof console.log === "function") {
      console.log(place);
    }

    var street_number = null;
    var route = null;
    var zip_code = null;
    var city = null;
    var country_code = null;
    for (var i in place.address_components) {
      var component = place.address_components[i];
      for (var j in component.types) {
        var type = component.types[j];
        if (type === 'street_number') {
          street_number = component.long_name;
        } else if (type === 'route') {
          route = component.long_name;
        } else if (type === 'postal_code') {
          zip_code = component.long_name;
        } else if (type === 'locality') {
          city = component.long_name;
        } else if (type === 'postal_town' && city === null) {
          city = component.long_name;
        } else if (type === 'country') {
          country_code = component.short_name;
        }
      }
    }

    return {
      full_address: street_number === null ? route : (street_number + ' ' + route),
      zip_code: zip_code,
      city: city
    };
  }

  document.addEventListener("DOMContentLoaded", function() {
    var cookAddressOne = document.getElementById('cook_cook_places_attributes_0_place_attributes_full_address');
    var cookAddressTwo = document.getElementById('cook_cook_places_attributes_1_place_attributes_full_address');
    var cookAddressThree = document.getElementById('cook_cook_places_attributes_2_place_attributes_full_address');

    if (cookAddressOne) {
      var autocomplete = new google.maps.places.Autocomplete(cookAddressOne, { types: ['geocode'], componentRestrictions: {country: 'fr'} });
      google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
      google.maps.event.addDomListener(cookAddressOne, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }

    if (cookAddressTwo) {
      var autocomplete = new google.maps.places.Autocomplete(cookAddressTwo, { types: ['geocode'], componentRestrictions: {country: 'fr'} });
      google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
      google.maps.event.addDomListener(cookAddressTwo, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }

    if (cookAddressThree) {
      var autocomplete = new google.maps.places.Autocomplete(cookAddressThree, { types: ['geocode'], componentRestrictions: {country: 'fr'} });
      google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
      google.maps.event.addDomListener(cookAddressThree, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }

  });


