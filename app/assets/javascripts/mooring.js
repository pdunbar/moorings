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

  featureLayer.on('ready', function() {
    featureLayer.eachLayer(function(layer) {
      var content = '<h2>' + layer.feature.properties.name + '!<\/h2>' +
          '<p>From: ' + layer.feature.properties.from + '<br \/>' +
          'to: ' + layer.feature.properties.to + '<\/p>';
      layer.bindPopup(content);
    });
  });
};
