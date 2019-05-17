import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('business_location');
  console.log(addressInput);
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
