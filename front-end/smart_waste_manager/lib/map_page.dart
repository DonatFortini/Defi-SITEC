import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';

const List<List<double>> jsonData = [
  [42.61083333333333, 9.35388888888889],
  [42.61222222222222, 9.356666666666666],
  [42.61416666666667, 9.354722222222222],
  [42.61527777777778, 9.351388888888888],
  [42.61694444444444, 9.355555555555556],
  [42.608333333333334, 9.358055555555556],
  [42.60194444444445, 9.359722222222222],
];

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late final MapController controller;
  final MarkerIcon markerIcon = const MarkerIcon(
    icon: Icon(
      Icons.delete_outline_sharp,
      color: Colors.red,
      size: 20,
    ),
  );

  final MarkerIcon marker = const MarkerIcon(
    icon: Icon(
      Icons.person_pin_circle_outlined,
      color: Colors.blue,
      size: 20,
    ),
  );

  @override
  void initState() {
    super.initState();
    controller = MapController(
      initMapWithUserPosition: const UserTrackingOption(),
      //initPosition: GeoPoint(latitude: 48.8534, longitude: 2.3488),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OSMFlutter(
        onMapIsReady: (start) async {
          if (start) {
            var position = await _determinePosition();

            //addMarker(position);

            setState(() async {
              await controller.addMarker(position, markerIcon: marker);
            });
          }
        },
        onLocationChanged: (myLocation) {
          //addMarker(myLocation);
          print(myLocation);
        },
        onGeoPointClicked: (d) {
          print(d);
        },
        controller: controller,
        osmOption: OSMOption(
          userLocationMarker: UserLocationMaker(personMarker: marker, directionArrowMarker: marker),
          zoomOption: const ZoomOption(initZoom: 15),
          markerOption: MarkerOption(
            defaultMarker: markerIcon,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          generateTrash();
        },
        child: const Icon(Icons.search),
      ),
    );
  }

  void addMarker(GeoPoint location) {
    setState(() {
      controller.addMarker(
        GeoPoint(latitude: location.latitude, longitude: location.longitude),
        iconAnchor: IconAnchor(anchor: Anchor.top),
        markerIcon: marker,
      );
    });
  }

  void generateTrash() {
    setState(() {
      for (var i = 0; i < jsonData.length; i++) {
        controller.addMarker(
          GeoPoint(latitude: jsonData[i][0], longitude: jsonData[i][1]),
        iconAnchor: IconAnchor(anchor: Anchor.top),
          markerIcon: markerIcon,
        );
      }
    });
  }

  Future<GeoPoint> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    // print(position);
    return GeoPoint(latitude: position.latitude, longitude: position.longitude);
  }
}
