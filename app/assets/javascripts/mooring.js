function mooringMap(options) {
  var centerLocation = options.centerLocation;
  var zoomLevel = options.zoomLevel || 14;
  var map = L.mapbox.map('map', 'pdunbar.ipfgki5i')
    .setView([centerLocation.latitude, centerLocation.longitude], zoomLevel);
  var locationParams = '?latitude=' + centerLocation.latitude + '&longitude=' + centerLocation.longitude;
  var featureLayer = L.mapbox.featureLayer()
    .loadURL('/moorings.json' + locationParams)
    .addTo(map)
};
