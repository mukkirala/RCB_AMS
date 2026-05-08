<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GeolocationAssets.aspx.cs" Inherits="GeolocationAssets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">  
    <style>
        #map {
             height: 400px;
             width: 100%;
             background-color: grey;
        }
    </style>
    <script async defer	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC4OIC6laoUOymHWljFKnYp1ytcXkY0Sak&signed_in=true&callback=initMap&region=IN"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.js"></script>

    <script type="text/javascript">  
        if (navigator.geolocation) {  
            navigator.geolocation.getCurrentPosition(success);  
        } else {  
        alert("There is Some Problem on your current browser to get Geo Location!");  
        }  
        
        function success(position) {  
            var locations = [];
            var assets = [];
           
            $.getJSON("http://nrlapi.neemus.com/api/ViewQRCode", function (response) {             
                console.log(response);
                for (var i = 0; i < response.length; i++) {
                    locations.push([response[i].mainAssetNumber, response[i].latitude, response[i].longitude]);
                }
                console.log(locations);

                var center = { lat: 20.593683, lng: 78.962883 };

                var map = new google.maps.Map(document.getElementById('map'), {
                     zoom: 5,
                     center: center
                });
                var infowindow =  new google.maps.InfoWindow({});
                var marker, count;
                for (count = 0; count < locations.length; count++) {
                    if (locations[count][1] !== "") {
                        console.log(locations[count][1], locations[count][2]);
                        marker = new google.maps.Marker({
                            position: new google.maps.LatLng(locations[count][1], locations[count][2]),
                            map: map,
                            title: locations[count][0]
                        });
                        google.maps.event.addListener(marker, 'click', (function (marker, count) {
                            return function () {
                                infowindow.setContent(locations[count][0]);
                                infowindow.open(map, marker);
                            }
                        })(marker, count));
                    }
                }
            });
                       
        } 
    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="col-sm-12">
    <div class="">
          
         <div style="">
             <strong><span class="">Asset Geo-Location on Map</span></strong>
         </div>
    
          <div class=" style3">
               
          </div>
          <br />
          <div class=" table-responsive">
            <div id="map"></div>              
          </div>
        <br/>            
    </div>
    </div>
</asp:Content>

