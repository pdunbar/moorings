function mooringMap(options) {
  var centerLocation = options.centerLocation;
  var zoomLevel = options.zoomLevel || 14;
  var map = L.mapbox.map('map', 'pdunbar.ipfgki5i')
    .setView([centerLocation.latitude, centerLocation.longitude], zoomLevel);
  var locationParams = '?latitude=' + centerLocation.latitude + '&longitude=' + centerLocation.longitude;
  var dateRange = options.dateRange;
  var dateParams = '&start_date=' + dateRange.startDate + '&end_date=' + dateRange.endDate;

  var featureLayer = L.mapbox.featureLayer()
    .loadURL('/moorings.json' + locationParams + dateParams)
    .addTo(map)
};

// featureLayer.eachLayer(function(layer) {

//     // here you call `bindPopup` with a string of HTML you create - the feature
//     // properties declared above are available under `layer.feature.properties`
//     var content = '<h2>Belfast Harbor<\/h2>' +
//         '<p>Location: ' + layer.feature.properties.location + '<br \/>' +
//         'to: ' + layer.feature.properties.to + '<\/p>';
//     layer.bindPopup(content);
// });
