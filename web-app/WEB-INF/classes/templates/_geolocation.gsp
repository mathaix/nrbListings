<script type="text/javascript">

var map;
var infowindow = new google.maps.InfoWindow();

function initialize() {

	if(navigator.geolocation) {
	    browserSupportFlag = true;
	    navigator.geolocation.getCurrentPosition(function(position) {
	    var jsonPos =  JSON.stringify(position);
	     ${remoteFunction(controller: 'geolocation',action:'setGeoPosition',params:'\'val=\' + jsonPos')}
	    });
	}
}  

</script>