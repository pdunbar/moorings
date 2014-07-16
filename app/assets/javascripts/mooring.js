$(document).ready(function(){
  var map = L.mapbox.map('map', 'pdunbar.ipfgki5i')
    .setView([44.426130, -68.995431], 14);
    $.ajax({
      dataType: 'text',
      url: '/moorings.json',
      success: function(data) {
        var geojson;
        geojson = $.parseJSON(data);
        console.log(geojson);
        return map.featureLayer.setGeoJSON(geojson);
    }
  });
});
