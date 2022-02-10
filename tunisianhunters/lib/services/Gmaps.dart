import 'dart:collection';
import 'package:geolocation/geolocation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tunisianhunters/models/mapLocations.dart';

class GMap extends StatefulWidget {
  GMap({Key key}) : super(key: key);

  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {

  List<mapLocations> locations = List<mapLocations>();
  Set<Marker> _markers = HashSet<Marker>();
  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Polyline> _polylines = HashSet<Polyline>();
  Set<Circle> _circles = HashSet<Circle>();
  bool _showMapStyle = false;

  GoogleMapController _mapController;
  BitmapDescriptor _markerIcon;

  @override
  void initState() {
    var location = mapLocations(
        id: 1,
        name: 'منتزه النحلي',
        address1: 'يحجر الصيد بالمنتزه الحضري بالنحلي',
        address2: '',
        lat: '36.884523',
        long: '10.156114',
        imageUrl: '');
    locations.add(location);
    location = mapLocations(
        id: 2,
        name: 'Armurerie MECHERGUI',
        address1: '',
        address2: '',
        lat: '36.866001',
        long: '10.303114',
        imageUrl:
        '');
    locations.add(location);
    location = mapLocations(
        id: 3,
        name: 'Armurerie Allagui',
        address1: '',
        address2: '',
        lat: '36.890074',
        long: '10.164315',
        imageUrl:
        '');
    locations.add(location);
    location = mapLocations(
        id: 4,
        name: 'TejChasse',
        address1: '',
        address2: '',
        lat: '36.857815',
        long: '10.192185',
        imageUrl:
        '');
    locations.add(location);
    super.initState();

    _setPolygons();
    _setPolylines();
    _setCircles();
  }

  void _toggleMapStyle() async {
    String style = await DefaultAssetBundle.of(context).loadString('assets/map_style.json');

    if (_showMapStyle) {
      _mapController.setMapStyle(style);
    } else {
      _mapController.setMapStyle(null);
    }
  }

  void _setPolygons() {
    List<LatLng> polygonLatLongs = List<LatLng>();
    polygonLatLongs.add(LatLng(36.892860, 10.147839));
    polygonLatLongs.add(LatLng(36.892100, 10.147786));
    polygonLatLongs.add(LatLng(36.892022, 10.147860));
    polygonLatLongs.add(LatLng(36.891719, 10.148315));
    polygonLatLongs.add(LatLng(36.891436, 10.148470));
    polygonLatLongs.add(LatLng(36.891248, 10.149062));
    polygonLatLongs.add(LatLng(36.891013, 10.149210));
    polygonLatLongs.add(LatLng(36.890946, 10.149589));
    polygonLatLongs.add(LatLng(36.890570, 10.149900));
    polygonLatLongs.add(LatLng(36.890451, 10.150156));
    polygonLatLongs.add(LatLng(36.890015, 10.150390));
    polygonLatLongs.add(LatLng(36.889900, 10.150506));
    polygonLatLongs.add(LatLng(36.889845, 10.150783));
    polygonLatLongs.add(LatLng(36.889772, 10.150869));
    polygonLatLongs.add(LatLng(36.889613, 10.150895));
    polygonLatLongs.add(LatLng(36.889413, 10.150804));
    polygonLatLongs.add(LatLng(36.889213, 10.150496));
    polygonLatLongs.add(LatLng(36.888657, 10.149419));
    polygonLatLongs.add(LatLng(36.888443, 10.149042));
    polygonLatLongs.add(LatLng(36.888199, 10.148857));
    polygonLatLongs.add(LatLng(36.887938, 10.148728));
    polygonLatLongs.add(LatLng(36.887587, 10.148678));
    polygonLatLongs.add(LatLng(36.887023, 10.148807));
    polygonLatLongs.add(LatLng(36.886833, 10.149044));
    polygonLatLongs.add(LatLng(36.886477, 10.149184));
    polygonLatLongs.add(LatLng(36.885884, 10.149314));
    polygonLatLongs.add(LatLng(36.885635, 10.149189));
    polygonLatLongs.add(LatLng(36.885410, 10.149036));
    polygonLatLongs.add(LatLng(36.885110, 10.148954));
    polygonLatLongs.add(LatLng(36.884580, 10.149012));
    polygonLatLongs.add(LatLng(36.884434, 10.149201));
    polygonLatLongs.add(LatLng(36.884597, 10.149408));
    polygonLatLongs.add(LatLng(36.884453, 10.149629));
    polygonLatLongs.add(LatLng(36.884332, 10.149748));
    polygonLatLongs.add(LatLng(36.884051, 10.149739));
    polygonLatLongs.add(LatLng(36.883982, 10.150195));
    polygonLatLongs.add(LatLng(36.882929, 10.151668));
    polygonLatLongs.add(LatLng(36.882684, 10.151174));
    polygonLatLongs.add(LatLng(36.882373, 10.150922));
    polygonLatLongs.add(LatLng(36.881438, 10.150450));
    polygonLatLongs.add(LatLng(36.881336, 10.149945));
    polygonLatLongs.add(LatLng(36.880945, 10.149550));
    polygonLatLongs.add(LatLng(36.880818, 10.148936));
    polygonLatLongs.add(LatLng(36.880949, 10.148604));
    polygonLatLongs.add(LatLng(36.881036, 10.148182));
    polygonLatLongs.add(LatLng(36.880767, 10.148306));
    polygonLatLongs.add(LatLng(36.880501, 10.148670));
    polygonLatLongs.add(LatLng(36.880041, 10.149218));
    polygonLatLongs.add(LatLng(36.879929, 10.149394));
    polygonLatLongs.add(LatLng(36.879841, 10.149398));
    polygonLatLongs.add(LatLng(36.879608, 10.149414));
    polygonLatLongs.add(LatLng(36.879261, 10.149671));
    polygonLatLongs.add(LatLng(36.878916, 10.150162));
    polygonLatLongs.add(LatLng(36.878193, 10.151170));
    polygonLatLongs.add(LatLng(36.877825, 10.151721));
    polygonLatLongs.add(LatLng(36.877602, 10.151998));
    polygonLatLongs.add(LatLng(36.877365, 10.152332));
    polygonLatLongs.add(LatLng(36.877302, 10.152342));
    polygonLatLongs.add(LatLng(36.877105, 10.152372));
    polygonLatLongs.add(LatLng(36.876827, 10.152325));
    polygonLatLongs.add(LatLng(36.876646, 10.152109));
    polygonLatLongs.add(LatLng(36.876497, 10.151970));
    polygonLatLongs.add(LatLng(36.876003, 10.152368));
    polygonLatLongs.add(LatLng(36.875586, 10.152705));
    polygonLatLongs.add(LatLng(36.875126, 10.152987));
    polygonLatLongs.add(LatLng(36.875045, 10.153031));
    polygonLatLongs.add(LatLng(36.874763, 10.152977));
    polygonLatLongs.add(LatLng(36.874457, 10.153505));
    polygonLatLongs.add(LatLng(36.874130, 10.154068));
    polygonLatLongs.add(LatLng(36.874048, 10.154133));
    polygonLatLongs.add(LatLng(36.873858, 10.154284));
    polygonLatLongs.add(LatLng(36.873803, 10.154329));
    polygonLatLongs.add(LatLng(36.873727, 10.154231));
    polygonLatLongs.add(LatLng(36.873559, 10.154018));
    polygonLatLongs.add(LatLng(36.873407, 10.153825));
    polygonLatLongs.add(LatLng(36.873291, 10.153536));
    polygonLatLongs.add(LatLng(36.873227, 10.153375));
    polygonLatLongs.add(LatLng(36.873125, 10.153537));
    polygonLatLongs.add(LatLng(36.873025, 10.153703));
    polygonLatLongs.add(LatLng(36.872783, 10.154092));
    polygonLatLongs.add(LatLng(36.872583, 10.154424));
    polygonLatLongs.add(LatLng(36.872338, 10.154815));
    polygonLatLongs.add(LatLng(36.872192, 10.155053));
    polygonLatLongs.add(LatLng(36.872007, 10.155347));
    polygonLatLongs.add(LatLng(36.871889, 10.155536));
    polygonLatLongs.add(LatLng(36.871859, 10.155607));
    polygonLatLongs.add(LatLng(36.872023, 10.155636));
    polygonLatLongs.add(LatLng(36.872179, 10.155661));
    polygonLatLongs.add(LatLng(36.872344, 10.155689));
    polygonLatLongs.add(LatLng(36.872638, 10.155737));
    polygonLatLongs.add(LatLng(36.872886, 10.155779));
    polygonLatLongs.add(LatLng(36.873143, 10.155820));
    polygonLatLongs.add(LatLng(36.873380, 10.155861));
    polygonLatLongs.add(LatLng(36.873524, 10.155886));
    polygonLatLongs.add(LatLng(36.873861, 10.155941));
    polygonLatLongs.add(LatLng(36.874051, 10.155973));
    polygonLatLongs.add(LatLng(36.874094, 10.155981));
    polygonLatLongs.add(LatLng(36.874111, 10.155986));
    polygonLatLongs.add(LatLng(36.874952, 10.156370));
    polygonLatLongs.add(LatLng(36.875431, 10.156839));
    polygonLatLongs.add(LatLng(36.875341, 10.157759));
    polygonLatLongs.add(LatLng(36.874957, 10.157934));
    polygonLatLongs.add(LatLng(36.875504, 10.159412));
    polygonLatLongs.add(LatLng(36.875793, 10.159374));
    polygonLatLongs.add(LatLng(36.875399, 10.160632));
    polygonLatLongs.add(LatLng(36.875675, 10.161134));
    polygonLatLongs.add(LatLng(36.876216, 10.161362));
    polygonLatLongs.add(LatLng(36.876461, 10.161308));
    polygonLatLongs.add(LatLng(36.875984, 10.162644));
    polygonLatLongs.add(LatLng(36.875738, 10.164215));
    polygonLatLongs.add(LatLng(36.876117, 10.165986));
    polygonLatLongs.add(LatLng(36.876351, 10.167080));
    polygonLatLongs.add(LatLng(36.878452, 10.167029));
    polygonLatLongs.add(LatLng(36.878918, 10.167249));
    polygonLatLongs.add(LatLng(36.879544, 10.167548));
    polygonLatLongs.add(LatLng(36.879937, 10.167733));
    polygonLatLongs.add(LatLng(36.880374, 10.167425));
    polygonLatLongs.add(LatLng(36.880981, 10.166999));
    polygonLatLongs.add(LatLng(36.881566, 10.166574));
    polygonLatLongs.add(LatLng(36.882152, 10.166159));
    polygonLatLongs.add(LatLng(36.882554, 10.165570));
    polygonLatLongs.add(LatLng(36.882878, 10.165077));
    polygonLatLongs.add(LatLng(36.882531, 10.164606));
    polygonLatLongs.add(LatLng(36.882883, 10.164058));
    polygonLatLongs.add(LatLng(36.883327, 10.163369));
    polygonLatLongs.add(LatLng(36.883533, 10.163059));
    polygonLatLongs.add(LatLng(36.883814, 10.162779));
    polygonLatLongs.add(LatLng(36.883986, 10.162350));
    polygonLatLongs.add(LatLng(36.884311, 10.162115));
    polygonLatLongs.add(LatLng(36.884092, 10.161810));
    polygonLatLongs.add(LatLng(36.884223, 10.161158));
    polygonLatLongs.add(LatLng(36.884340, 10.160591));
    polygonLatLongs.add(LatLng(36.884442, 10.160075));
    polygonLatLongs.add(LatLng(36.884790, 10.160001));
    polygonLatLongs.add(LatLng(36.885063, 10.159945));
    polygonLatLongs.add(LatLng(36.885314, 10.159893));
    polygonLatLongs.add(LatLng(36.885496, 10.160433));
    polygonLatLongs.add(LatLng(36.885692, 10.161011));
    polygonLatLongs.add(LatLng(36.885906, 10.161646));
    polygonLatLongs.add(LatLng(36.886173, 10.162424));
    polygonLatLongs.add(LatLng(36.886377, 10.163035));
    polygonLatLongs.add(LatLng(36.886578, 10.163624));
    polygonLatLongs.add(LatLng(36.886758, 10.164143));
    polygonLatLongs.add(LatLng(36.887119, 10.163772));
    polygonLatLongs.add(LatLng(36.887634, 10.163242));
    polygonLatLongs.add(LatLng(36.888884, 10.161951));
    polygonLatLongs.add(LatLng(36.888654, 10.161502));
    polygonLatLongs.add(LatLng(36.888364, 10.160937));
    polygonLatLongs.add(LatLng(36.888021, 10.160262));
    polygonLatLongs.add(LatLng(36.887740, 10.159712));
    polygonLatLongs.add(LatLng(36.887803, 10.159578));
    polygonLatLongs.add(LatLng(36.887931, 10.159494));
    polygonLatLongs.add(LatLng(36.888339, 10.159496));
    polygonLatLongs.add(LatLng(36.888674, 10.159519));
    polygonLatLongs.add(LatLng(36.888823, 10.159614));
    polygonLatLongs.add(LatLng(36.889072, 10.159625));
    polygonLatLongs.add(LatLng(36.889329, 10.159607));
    polygonLatLongs.add(LatLng(36.889682, 10.159450));
    polygonLatLongs.add(LatLng(36.890140, 10.159251));
    polygonLatLongs.add(LatLng(36.890188, 10.159079));
    polygonLatLongs.add(LatLng(36.890388, 10.158775));
    polygonLatLongs.add(LatLng(36.890702, 10.158658));
    polygonLatLongs.add(LatLng(36.890833, 10.157521));
    polygonLatLongs.add(LatLng(36.890738, 10.156361));
    polygonLatLongs.add(LatLng(36.890619, 10.155113));
    polygonLatLongs.add(LatLng(36.890561, 10.154611));
    polygonLatLongs.add(LatLng(36.890753, 10.153011));
    polygonLatLongs.add(LatLng(36.891236, 10.151576));
    polygonLatLongs.add(LatLng(36.891629, 10.150855));
    polygonLatLongs.add(LatLng(36.892206, 10.149709));
    polygonLatLongs.add(LatLng(36.892548, 10.148909));
    polygonLatLongs.add(LatLng(36.892740, 10.148460));
    polygonLatLongs.add(LatLng(36.892778, 10.148265));
    polygonLatLongs.add(LatLng(36.892831, 10.147994));
    polygonLatLongs.add(LatLng(36.892861, 10.147836));

    _polygons.add(
      Polygon(
        polygonId: PolygonId("0"),
        points: polygonLatLongs,
        fillColor: Colors.red[200],
        strokeWidth: 1,
      ),
    );
  }

  void _setPolylines() {
    List<LatLng> polylineLatLongs = List<LatLng>();
    polylineLatLongs.add(LatLng(37.74493, -122.42932));
    polylineLatLongs.add(LatLng(37.74693, -122.41942));
    polylineLatLongs.add(LatLng(37.74923, -122.41542));
    polylineLatLongs.add(LatLng(37.74923, -122.42582));

    _polylines.add(
      Polyline(
        polylineId: PolylineId("0"),
        points: polylineLatLongs,
        color: Colors.purple,
        width: 1,
      ),
    );
  }

  void _setCircles() {
    _circles.add(
      Circle(
          circleId: CircleId("0"),
          center: LatLng(36.862684, 10.066615),
          radius: 200,
          strokeWidth: 1,
          fillColor: Color.fromRGBO(102, 51, 153, .5)),
    );
  }


  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    setState(() {
      locations.forEach((loc) {
        if(loc.id==1){
        _markers.add(Marker(
            markerId:MarkerId( loc.id.toString()),
            position: LatLng(double.parse(loc.lat), double.parse(loc.long)),
            infoWindow: InfoWindow(
            title:loc.name,
                snippet: loc.address1  + loc.address2)));}
        else{
          _markers.add(Marker(
              markerId:MarkerId( loc.id.toString()),
              position: LatLng(double.parse(loc.lat), double.parse(loc.long)),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
              infoWindow: InfoWindow(
                  title:loc.name,
                  snippet: loc.address1  + loc.address2)));}

      });
    });
  }
  getPermission() async{
    final GeolocationResult result = await Geolocation.requestLocationPermission(permission:const LocationPermission(
        android: LocationPermissionAndroid.fine,
        ios: LocationPermissionIOS.always));
    return result;
  }
  @override
  Widget build(BuildContext context) {
    getPermission();
    return Scaffold(
      appBar: AppBar(title: Text('Map'),
        backgroundColor: Colors.green[400],),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(36.884431, 10.156222),
              zoom: 12,
            ),
            markers: _markers,
            polygons: _polygons,
            //polylines: _polylines,
            circles: _circles,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
            child: Text(""),
          )
        ],
      ),
    );
  }
}