
function initialize() {
	infowindow = new google.maps.InfoWindow({ pixelOffset: new google.maps.Size(0, -34) });
  var myLatlng = new google.maps.LatLng(37.09, -95.71),

  		myOptions = {
	   		zoom: 4,
		    center: myLatlng,
		    mapTypeId: google.maps.MapTypeId.ROADMAP
		  },
		
			map = new google.maps.Map(document.getElementById("map_canvas"), myOptions),
			
			markers = [ a = {latlng: new google.maps.LatLng(39.1484956, -84.598031), 
											title: 'The Cincinnati Bass Cellar' },
		 						b = {latlng: new google.maps.LatLng(41.662427, -91.512043), 
											title: 'Heartland String Bass Shop' },
								c = {latlng: new google.maps.LatLng(39.1628618, -84.5398662), 
											title: 'Nick LLoyd Basses', phone: '513-681-1863' },
								d = {latlng: new google.maps.LatLng(41.1641135, -73.4249774), title: 'd' },
								e = {latlng: new google.maps.LatLng(42.964613, -85.662771), 
											title: 'Steven Reiley at Guaneri House' },
								f = {latlng: new google.maps.LatLng(37.066083,  -122.078062), title: 'f' },
								g = {latlng: new google.maps.LatLng(38.987076, -76.792751), title: 'g' },
								h = {latlng: new google.maps.LatLng(37.8056014, -122.2743443), title: 'h' },
								i = {latlng: new google.maps.LatLng(40.0560649, -83.0194269), title: 'i' }];


  for (var i = 0; i < markers.length; i++) {
			createMarker(markers[i]);
   }

  google.maps.event.addListener(map, "click", function() {
		infowindow.close();
	});

  function createMarker(m) {
	  var markerContent = '<b>' + m.title + '</b><br /><br />' + m.phone + 
			'<br /><br /><a href="#">Get Directions</a>';
    var marker = new google.maps.Marker({position: m.latlng, map: map});
		marker.content = markerContent;
    google.maps.event.addListener(marker, "click", function() {
      if (infowindow) infowindow.close();
			infowindow.setPosition(marker.position);
    	infowindow.setContent(marker.content);
      infowindow.open(map);
    });
    return marker;
  }
}

$(document).ready(function() {
	if ($('body').hasClass('distributors')) {
		initialize();
		
		// Accordion
		$("#accordion").accordion({ header: "h3", autoHeight: false });

		//hover states on the static widgets
		$('#dialog_link, ul#icons li').hover(
			function() { $(this).addClass('ui-state-hover'); }, 
			function() { $(this).removeClass('ui-state-hover'); }
		);
	} 

});