<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AssetGeoLocation.aspx.cs" Inherits="AssetGeoLocation" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">  
         
        #MyMapLOC  
        {  
           height: 400px;
             width: 100%;
             background-color: grey;
        }  
    </style>  
    
   <%-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6v5-2uaq_wusHDktM9ILcqIrlPtnZgEk&sensor=false">  
    </script>  --%>
  
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places">  
    </script>  
  
    <script type="text/javascript">  
        if (navigator.geolocation) {  
            navigator.geolocation.getCurrentPosition(success);
        } else {  
        alert("There is Some Problem on your current browser to get Geo Location!");  
        }  
  
        function success(position) {  
            var lat = <%=Session["Latitude"] %>;
            var long = <%=Session["Longitude"] %>; 
           

            console.log(lat, long,'<%=Session["Main"] %>' ,'<%=Session["AssetDesc"] %>');
            var LatLng = new google.maps.LatLng(lat, long);  

            var mapOptions = {  
                center: LatLng,  
                zoom: 12,  
                mapTypeId: google.maps.MapTypeId.ROADMAP  
            };  
  
            var map = new google.maps.Map(document.getElementById("MyMapLOC"), mapOptions);  
            var marker = new google.maps.Marker({  
                position: LatLng,  
                title: "<div style = 'height:60px;width:200px'><b>Your location:</b><br />Latitude: "   
                            + lat + +"<br />Longitude: " + long  
            });  
  
            marker.setMap(map);  
            var getInfoWindow = new google.maps.InfoWindow({ content: "<b>Your Asset Location</b><br/> Latitude:" +   
                                    lat + "<br /> Longitude:" + long + "<br /> MainAssetNumber:" + '<%=Session["Main"] %>' + "<br /> Description:" + '<%=Session["AssetDesc"] %>' + "" });  
            getInfoWindow.open(map, marker);  
        }  
    </script>  
  </head>
  <body>  
    <div class="col-sm-12">
    <div class="">
          
         <div style="">
             <strong><span class="">Asset Geo-Location on Map</span></strong>
         </div>
    
          <div class=" style3">
               
          </div>
          <br />
          <div class=" table-responsive">
            <div id="MyMapLOC"></div>              
          </div>
        <br/>            
    </div>
    </div>
  </body>
</html>
