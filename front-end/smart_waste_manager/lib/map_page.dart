import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';

// depot 42.60080491507166, 9.322923935409024
const List<List<double>> jsonData = [
  [42.61083333333333, 9.35388888888889],
  [42.61222222222222, 9.356666666666666],
  [42.61416666666667, 9.354722222222222],
  [42.61527777777778, 9.351388888888888],
  [42.61694444444444, 9.355555555555556],
  [42.608333333333334, 9.358055555555556],
  [42.60194444444445, 9.359722222222222],
];

const List<List<double>> jsonDataOpti = [
  [42.610739, 9.353762],
  [42.612003, 9.356994],
  [42.61424, 9.354932],
  [42.615264, 9.351521],
  [42.61689, 9.355714],
  [42.608325, 9.358137],
  [42.601945, 9.359801],
];

const List<List<double>> jsonDataOptiDonat = [
  [42.61527777777778, 9.351388888888888],
  [42.61694444444444, 9.355555555555556],
  [42.61416666666667, 9.354722222222222],
  [42.61083333333333, 9.35388888888889],
  [42.61222222222222, 9.356666666666666],
  [42.608333333333334, 9.358055555555556],
  [42.60194444444445, 9.359722222222222]
];

const List<List<double>> jsonDataOptiDonatComplet = [
  [42.58527777777778, 9.300833333333333],
  [42.58388888888889, 9.301388888888889],
  [42.59166666666667, 9.3025],
  [42.59111111111111, 9.305833333333334],
  [42.59388888888889, 9.3],
  [42.57972222222222, 9.286666666666667],
  [42.581388888888895, 9.288055555555555],
  [42.58277777777778, 9.274444444444445],
  [42.583333333333336, 9.2725],
  [42.59805555555556, 9.264722222222222],
  [42.598333333333336, 9.267222222222223],
  [42.60138888888889, 9.271111111111113],
  [42.60527777777778, 9.261388888888888],
  [42.60472222222222, 9.256666666666666],
  [42.60138888888889, 9.253055555555555],
  [42.60472222222222, 9.253333333333334],
  [42.66, 9.2425],
  [42.6675, 9.300555555555556],
  [42.66888888888889, 9.3],
  [42.66722222222222, 9.301666666666668],
  [42.68527777777778, 9.300555555555556],
  [42.68555555555555, 9.318333333333333],
  [42.679443, 9.302113],
  [42.68049, 9.297295],
  [42.66777777777777, 9.301944444444445],
  [42.680252, 9.307342],
  [42.66888888888889, 9.301666666666668],
  [42.651944444444446, 9.284444444444444],
  [42.66722222222222, 9.28361111111111],
  [42.66861111111111, 9.284444444444444],
  [42.68472222222222, 9.3025],
  [42.692499999999995, 9.3225],
  [42.68861111111111, 9.321944444444444],
  [42.67638888888889, 9.302777777777779],
  [42.672777777777775, 9.302222222222223],
  [42.72916666666667, 9.359166666666667],
  [42.725833333333334, 9.361666666666666],
  [42.73027777777778, 9.365833333333333],
  [42.73222222222223, 9.365277777777777],
  [42.731944444444444, 9.362222222222222],
  [42.731388888888894, 9.355277777777777],
  [42.73222222222223, 9.349722222222223],
  [42.73111111111111, 9.344444444444445],
  [42.73111111111111, 9.342222222222222],
  [42.73555555555556, 9.352777777777778],
  [42.737500000000004, 9.346666666666668],
  [42.71194444444445, 9.326666666666666],
  [42.69444444444444, 9.362499999999999],
  [42.6975, 9.358888888888888],
  [42.69916666666666, 9.364722222222222],
  [42.700833333333335, 9.362222222222222],
  [42.70333333333333, 9.365833333333333],
  [42.70166666666667, 9.35611111111111],
  [42.70055555555556, 9.359166666666667],
  [42.70444444444445, 9.361944444444443],
  [42.69777777777777, 9.362499999999999],
  [42.69777777777777, 9.352222222222222],
  [42.689166666666665, 9.378333333333334],
  [42.69138888888889, 9.375555555555556],
  [42.689166666666665, 9.375555555555556],
  [42.68722222222222, 9.375],
  [42.68833333333333, 9.381944444444445],
  [42.68722222222222, 9.371666666666668],
  [42.68861111111111, 9.367777777777778],
  [42.68888888888888, 9.363888888888889],
  [42.690555555555555, 9.36],
  [42.635, 9.351111111111111],
  [42.63583333333333, 9.351944444444444],
  [42.63805555555555, 9.36361111111111],
  [42.63361111111111, 9.352222222222222],
  [42.61833333333333, 9.351944444444444],
  [42.61888888888889, 9.333333333333334],
  [42.626666666666665, 9.3575],
  [42.628055555555555, 9.344166666666668],
  [42.651944444444446, 9.318333333333333],
  [42.63583333333333, 9.351944444444444],
  [42.65083333333333, 9.319166666666666],
  [42.65138888888889, 9.316666666666666],
  [42.654444444444444, 9.320833333333333],
  [42.65888888888889, 9.322777777777777],
  [42.66694444444444, 9.305277777777778],
  [42.62305555555555, 9.319444444444445],
  [42.61083333333333, 9.35388888888889],
  [42.61222222222222, 9.356666666666666],
  [42.61416666666667, 9.354722222222222],
  [42.61527777777778, 9.351388888888888],
  [42.61694444444444, 9.355555555555556],
  [42.608333333333334, 9.358055555555556],
  [42.60194444444445, 9.359722222222222],
  [42.58222222222223, 9.360555555555555],
  [42.57944444444445, 9.362777777777778],
  [42.58027777777778, 9.3675],
  [42.58222222222223, 9.370277777777778],
  [42.57888888888889, 9.357222222222221],
  [42.57805555555556, 9.362222222222222],
  [42.575, 9.324722222222222],
  [42.57916666666667, 9.328333333333333],
  [42.58111111111111, 9.329166666666666],
  [42.577222222222225, 9.32638888888889],
  [42.57972222222222, 9.329444444444444],
  [42.59861111111111, 9.338055555555556],
  [42.59444444444445, 9.342500000000001],
  [42.59388888888889, 9.354722222222222]
];

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late final MapController controller;
  late GeoPoint position;
  late RoadInfo? roadInfo;
  bool showRoad = false;

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
            position = await _determinePosition();

            //addMarker(position);

            setState(() async {
              await controller.addMarker(position, markerIcon: marker);
            });
          }
        },
        onLocationChanged: (myLocation) {
          //addMarker(myLocation);
          position = myLocation;
          print(myLocation);
        },
        onGeoPointClicked: (d) {
          print(d);
        },
        controller: controller,
        osmOption: OSMOption(
          // userTrackingOption: UserTrackingOption(
          //   enableTracking: true,
          //     unFollowUser: false,
          // ),
          userLocationMarker: UserLocationMaker(personMarker: marker, directionArrowMarker: marker),
          zoomOption: const ZoomOption(initZoom: 15),
          markerOption: MarkerOption(
            defaultMarker: markerIcon,
          ),
        ),
      ),

      //////////////////////////////////////////////
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (showRoad)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.red,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              "Distance : ${roadInfo?.distance} km",
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Temps : ${(roadInfo!.duration! / 60).toStringAsFixed(0)} min",
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Temps : ${(roadInfo!.distance! * 0.0711 * 10).toStringAsFixed(2)} kgCO2e/km",
                              style: const TextStyle(color: Colors.white),
                            ),
                            //Text("${roadInfo?.instructions[0]}${roadInfo?.instructions[1]}", style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              Column(
                children: [
                  if (showRoad)
                    ElevatedButton(
                      onPressed: () async {
                        await controller.removeLastRoad();
                        generateTrash(jsonDataOptiDonatComplet);
                        setState(() {});
                      },
                      child: const Icon(Icons.delete),
                    ),
                  ElevatedButton(
                    onPressed: () => generateTrash(jsonDataOptiDonatComplet),
                    child: const Icon(Icons.search),
                  ),
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     var position = await _determinePosition();

                  //   },
                  //   child: const Icon(Icons.navigation_outlined),
                  // ),
                  ElevatedButton(
                    onPressed: () => getTrajet(jsonDataOptiDonatComplet),
                    child: const Icon(Icons.edit_road_sharp),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  void getTrajet(List<List<double>> json) async {
    final GeoPoint start = position;
    final GeoPoint end = GeoPoint(latitude: json.last[0], longitude: json.last[1]);

    final List<GeoPoint> points = [];
    for (var i = 0; i < json.length - 1; i++) {
      points.add(GeoPoint(latitude: json[i][0], longitude: json[i][1]));
    }
    roadInfo = await controller.drawRoad(
      start,
      end,
      roadType: RoadType.car,
      intersectPoint: points,
      roadOption: const RoadOption(
        roadColor: Colors.blue,
        roadWidth: 2,
        zoomInto: true,
      ),
    );
    setState(() {
      showRoad = true;
    });
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

  void generateTrash(List<List<double>> json) {
    setState(() {
      for (var i = 0; i < json.length; i++) {
        controller.addMarker(
          GeoPoint(latitude: json[i][0], longitude: json[i][1]),
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
