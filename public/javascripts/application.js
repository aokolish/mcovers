/*!
 * application.js
 */

$(function() {
	
	var page = $('body').attr('class');

	//call appropriate module's init method
	switch (page) {
		case "distributors":
			Distributors.init();
			break;
		case "custom":
			Custom.init();
			break;
		case "gallery":
			Gallery.init();
			break;
		case "sizes":
			Sizes.init();
			break;
	}

});

//
//Distributors page
//
var Distributors = (function() {
	
	return {
		init: function() {
			
			initMap();

			$("#accordion").accordion({
			      header: "h3",
			      autoHeight: false,
			 			collapsible: true
			  });

		 	function initMap() {
		    var infowindow = new google.maps.InfoWindow({
		        pixelOffset: new google.maps.Size(0, -34)
		    }),
		    myLatlng = new google.maps.LatLng(37.09, -95.71),
		    markers = [],

		    myOptions = {
		        zoom: 4,
		        center: myLatlng,
		        mapTypeId: google.maps.MapTypeId.ROADMAP
		    },

		    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

				for (var i in distributors) if (distributors.hasOwnProperty(i)) {               	// distributors obj from distributors.html page
					markers.push(createMarker(distributors[i], i));                               	// for each one push onto array of markers and create a marker for the map
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
		            if (infowindow) {infowindow.close();}
		            infowindow.setPosition(marker.position);
		            infowindow.setContent(marker.content);
		            infowindow.open(map);
		        });
		        return marker;
		    }

		    function getInfoHTML(store) {																												 // constructs markup for the info window (used for each marker)
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
			}
		}
	}
	

})()

//
//Custom page
//
var Custom = (function() {
	
	function calculateTotal() {
		// add up the price of the bag based on the options selected
		var checkedInputs = $('div.prices input:checked'), 
				prices = [],
				total = 0, 
				formattedPrice;
		
		$.each(checkedInputs, function(i, input) {
			var price = $(input).parent().siblings().text().trim().replace(/\$|\?/g, ''),
					price = parseInt(price, 10);
			
			// only push numbers on to the array of prices
			if (!isNaN(price)) {
				prices.push(price);
			}
			
		});
		
		// add the prices
		$.each(prices, function(i, price) {
			total += price;
		});
		
		formattedPrice = $('#custom_pockets').attr('checked') ? '~$' + total : '$' + total;
		
		// effect is from jquery ui
		$('tr.last td').text(formattedPrice).effect( 'highlight', null, 1000 );
		
	}
	
	return {
		init: function() {
			
			// hide all prices for form fields that are not checked
			$("input:not(:checked)").parent().siblings().hide();

			$('div.prices input').click(function() {
				var price = $(this).parent().siblings(),
						isRadio = $(this).attr('type') === 'radio' ? true : false,
						checked = $(this).filter(':checked').length > 0 ? true : false;

				if (!isRadio && checked) {	
					// this is a checkbox
					price.show();
				} else if (isRadio && checked) {
					// hide all prices associated with radio inputs that are not checked
					$('div.prices input[type="radio"]').filter(':not(:checked)')
						.parent().siblings().hide();
					
					price.show();
				} else {															
					// input has been unchecked
					price.hide();
				}
				
				calculateTotal();

			});
			
		}
	}
	
})()

//
//Gallery page
//
var Gallery = (function() {

	return {
		init: function () {

			$('.content-wrap > a').colorbox({ maxHeight : "80%" });

		}
	}
	
})()

//
//Sizes page
//
var Sizes = (function() {
		
	return {
		init: function() {
			
			$('.sizes-table tbody tr:nth-child(-n+14)').click(function() {	
				$(this).toggleClass('selected');
			});

			$('.sizes-table tbody tr:nth-child(-n+14)').hover(function() { 
				$(this).addClass('highlight');
			}, function() { 
				$(this).removeClass('highlight');
			});
			
		}
	}
	
})()
