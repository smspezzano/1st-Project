MQA.EventUtil.observe(window, 'load', function() {
  /*Create an object for options*/
          /*Create an object for options*/
  var options={
    elt:document.getElementById('map'),        /*ID of element on the page where you want the map added*/
    zoom:10,                                   /*initial zoom level of map*/
    latLng:{lat:37.7833, lng:-122.4167},   /*center of map in latitude/longitude*/
    mtype:'map',                               /*map type (map)*/
    bestFitMargin:0,                           /*margin offset from the map viewport when applying a bestfit on shapes*/
    zoomOnDoubleClick:true                     /*zoom in when double-clicking on map*/
  };
  window.map = new MQA.TileMap(options);

  /*Construct an instance of MQA.TileMap with the options object*/
  
  
  MQA.withModule('largezoom','traffictoggle','viewoptions','geolocationcontrol','insetmapcontrol','mousewheel','directions', function() {
    map.addControl(
      new MQA.LargeZoom(),
      new MQA.MapCornerPlacement(MQA.MapCorner.TOP_LEFT, new MQA.Size(5,5))
    );

    map.addControl(new MQA.TrafficToggle());

    map.addControl(new MQA.ViewOptions());

    map.addControl(
      new MQA.GeolocationControl(),
      new MQA.MapCornerPlacement(MQA.MapCorner.TOP_RIGHT, new MQA.Size(10,50))
    );

    /*Inset Map Control options */
    var options={
      size:{width:150, height:125},
      zoom:3,
      mapType:'map',
      minimized:true
    };

    map.addControl(
      new MQA.InsetMapControl(options),
      new MQA.MapCornerPlacement(MQA.MapCorner.BOTTOM_RIGHT)
    );

    map.enableMouseWheelZoom();

    //THIS IS FOR THE ROUTEING
      var selectedVal = "";
      var selected = $("input[type='radio'][name='roadGradeStrategy']:checked");
      if (selected.length > 0) {
        selectedVal = selected.val();
      } else {
          selectedVal = 'DEFAULT_STRATEGY'
      };
      /*Add options.*/
    map.addRoute([
      {street: document.getElementById('startLocation').value},
      {street: document.getElementById('endLocation').value}],
      {routeOptions: { ambiguities:'ignore', 
      					routeType:'bicycle', 
      					manMaps:'false', 
      					roadGradeStrategy: selectedVal
      	}, 
        ribbonOptions: {draggable:true}
      },
      /*Add the callback function to the route call.*/
      displayNarrative
    );
  });
});


  // Construct an instance of MQA.TileMap with the options object
  // window.map = new MQA.TileMap(options);

  
// var sessionID; 
/*Example function inspecting the route data and generating a narrative for display.*/
function displayNarrative(data){
var thissessionID = data.route.sessionId;
var sessionID = thissessionID;
  if(data.route){
    var legs = data.route.legs, html = '', i = 0, j = 0, trek, maneuver;
    html += '<table><tbody>';

    for (; i < legs.length; i++) {
      for (j = 0; j < legs[i].maneuvers.length; j++) {
        maneuver = legs[i].maneuvers[j];
        html += '<tr>';
        html += '<td>';

        if (maneuver.iconUrl) {
          html += '<img src="' + maneuver.iconUrl + '">  ';
        }

        for (k = 0; k < maneuver.signs.length; k++) {
          var sign = maneuver.signs[k];
          if (sign && sign.url) {
            html += '<img src="' + sign.url + '">  ';
          }
        }
        html += '</td><td>' + maneuver.narrative + '</td>';
        html += '</tr>';
      }
    }
    html += '</tbody></table>';
    document.getElementById('narrative').innerHTML = html;
  }
  getProfile(sessionID);
  doChart(sessionID);
};

var PROFILE = 'http://open.mapquestapi.com/elevation/v1/profile?key=Fmjtd%7Cluur2162nq%2C8l%3Do5-90z05a&callback=handleProfileResponse&shapeFormat=raw';
var CHART = 'http://open.mapquestapi.com/elevation/v1/chart?key=Fmjtd%7Cluur2162nq%2C8l%3Do5-90z05a&shapeFormat=raw';


function getProfile(sessionID) {
  var script = document.createElement('script');
  script.type = 'text/javascript';

  var basicURL = PROFILE;
  //add sessionID that holds the lat long to the url
  basicURL += '&sessionId=' + sessionID;  

  var newURL = basicURL;
  script.src = newURL;
  document.getElementsByTagName('head')[0].appendChild(script);
};


function handleProfileResponse(response) {
  var chartArray = response.elevationProfile;
  var chartArray2 = chartArray;
    var html = '';    
    var i = 0;
    html += '<table>';
    html += '<tr><th>Elevation</th><th>Distance</th></tr>';
    html += '<tbody>';  
    var incrementer;
    if(chartArray.length <= 20){
      incrementer = 1;
    } else {
      incrementer = Math.round(chartArray.length/20);
    };
    for(; i < chartArray.length; i += incrementer ) {
      html += '<tr><td>';
      html += chartArray[i].height;
      html += '</td>';
      html += '<td>';
      html += chartArray[i].distance;
      html += '</td>';
    };
    html += '<tr><th>Change</th></tr>';
    for(i=0; i < chartArray2.length - 1; i += incrementer) {
      html += '<td>';
      html += ((chartArray2[i+1].height) - (chartArray2[i].height)).toFixed(2);
      html += '</td></tr>';
    };
    html += '</tbody></table>';
    document.getElementById('profileResponse').innerHTML = html;
};


function doChart(sessionID) {
  var script = document.createElement('script');
    script.type = 'text/javascript';

  var newChartURL = CHART;

  newChartURL += '&inFormat=kvp&shapeFormat=raw&width=425&height=350&sessionId=' + sessionID;
  var newURL = newChartURL;
  script.src = newURL;

  document.getElementById('routeChart').innerHTML = '<IMG SRC ="' + script.src + '">';    
};







