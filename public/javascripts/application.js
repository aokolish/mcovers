function initialize() {
    var infowindow = new google.maps.InfoWindow({
        pixelOffset: new google.maps.Size(0, -34),
    }),
    myLatlng = new google.maps.LatLng(37.09, -95.71),
    markers = [],

    myOptions = {
        zoom: 4,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    },

    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

		// distributors obj from distributors.html page
		// for each one push onto array of markers and create a marker for the map
		for (i in distributors) {
			markers.push(createMarker(distributors[i], i));
		}

    google.maps.event.addListener(map, "click", function() {
        infowindow.close();
    });

    function createMarker(store, i) {
        store.latlng = new google.maps.LatLng(store.lat, store.lon);
        var marker = new google.maps.Marker({
            position: store.latlng,
            map: map
        });
        marker.content = getInfoHTML(store);
        google.maps.event.addListener(marker, "click", function() {
            if (infowindow) infowindow.close();
            infowindow.setPosition(marker.position);
            infowindow.setContent(marker.content);
            infowindow.open(map);
        });
        return marker;
    }

    function getInfoHTML(store) {
        // constructs markup for the info window (used for each marker)
        var content = $("div.infowindow.template").clone().removeClass("template"),
						href = "http://maps.google.com/maps?saddr=&daddr=" + store.address1 + "," + store.address2;
        content.find("p.store-name b").text(store.name);
        content.find("p.address-1").text(store.address1);
				content.find("p.address-2").text(store.address2);
        content.find("p.store-phone").text(store.phone1);
        content.find("a").attr("href", href);
        content = content.html();
        return content;
    }
}				// end initialize

$(document).ready(function() {
    if ($('body').hasClass('distributors')) {
        initialize();

        // Accordion
        $("#accordion").accordion({
            header: "h3",
            autoHeight: false,
						collapsible: true
        });

        // hover states on the static widgets
        $('#dialog_link, ul#icons li').hover( function() {
		            $(this).addClass('ui-state-hover');
		        }, function() {
		            $(this).removeClass('ui-state-hover');
		        }
        );
    }

});