var map;
var geocoder; 
var gmarkers = [];
var infowindow; 
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -34.397, lng: 150.644},
    zoom: 8
  });

  infowindow = new google.maps.InfoWindow({
    content: ""
  });

  geocoder = new google.maps.Geocoder();
}

function geocodeAddress(geocoder, resultsMap, address, label_number) {
  geocoder.geocode({'address': address}, function(results, status) {
    if (status === 'OK') {
      resultsMap.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location,
        label: label_number,
      });
      marker.addListener('click', function() {
        infowindow = new google.maps.InfoWindow({
        content: "" + results[0].formatted_address + ""
        });
        infowindow.open(map, marker);
      });
      gmarkers.push(marker);
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
});
}

function removeMarkers(){
for(i = 0; i< gmarkers.length; i++)
{
  gmarkers[i].setMap(null);
}
}



