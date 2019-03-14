(function() {
  /* __markers will hold a reference to all markers currently shown
     on the map, as GMaps4Rails won't do it for you.
     This won't pollute the global window object because we're nested
     in a "self-executed" anonymous function
     TODO Not working yet
  */
  var __markers;

  function updateMarkers(map, markersData) 
  {
    // Remove current markers
    map.removeMarkers(__markers);

    // Add each marker to the map according to received data
    __markers = _.map(markersData, function(markerJSON) {
      marker = map.addMarker(markerJSON);
      map.getMap().setZoom(4); // Not sure this should be in this iterator!

      _.extend(marker, markerJSON);

      marker.infowindow = new google.maps.InfoWindow({
        content: marker.infowindow
      });

      return marker;
    });

    map.bounds.extendWith(__markers);
    map.fitMapToBounds();
  };

  // "Publish" our method on window. You should probably have your own namespace
  window.updateMarkers = updateMarkers;
})();