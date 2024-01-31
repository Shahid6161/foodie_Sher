import 'package:flutter/material.dart';
import 'package:foodie_bunny/widgets/booking.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:location/location.dart' as loc;
import 'dart:ui';

class FoodieBunnyMap extends StatefulWidget {
  FoodieBunnyMap({Key key}) : super(key: key);

  @override
  _FoodieBunnyMapState createState() => _FoodieBunnyMapState();
}

class _FoodieBunnyMapState extends State<FoodieBunnyMap> {
  Future<Position> _currentLocation;
  Set<Marker> _markers = {};
  GoogleMapController _controller;
  final places =
      GoogleMapsPlaces(apiKey: "Your-key");

  @override
  void initState() {
    super.initState();
    _currentLocation = Geolocator.getCurrentPosition();
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _controller.setMapStyle(value);
  }

  Future<void> _retrieveNearbyRestaurants(LatLng _userLocation) async {
    PlacesSearchResponse _response = await places.searchNearbyWithRadius(
        Location(lat: _userLocation.latitude, lng: _userLocation.longitude),
        10000,
        type: "restaurant");

    Set<Marker> _restaurantMarkers = _response.results
        .map((result) => Marker(
            markerId: MarkerId(result.name),
            // Use an icon with different colors to differentiate between current location
            // and the restaurants
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueOrange),
            infoWindow: InfoWindow(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            backgroundColor: Colors.transparent,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                                child: Container(
                                  // height: 180,
                                  //width: 300,
                                  decoration: BoxDecoration(
                                      // border: Border.all(
                                      //     width: 0.5,
                                      //     color: Theme.of(context).buttonColor),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(30)),
                                      color: Colors.grey.withOpacity(0.21),
                                      // Theme.of(context).scaffoldBackgroundColor.withOpacity(0.45),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          offset: const Offset(-1.5, -1.5),
                                          color: Colors.black.withOpacity(0.08),
                                          spreadRadius: 1.8,
                                          blurRadius: 4,
                                        )
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0,
                                        bottom: 20.0,
                                        left: 26.0,
                                        right: 26.0), //14
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,

                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          result.name,
                                          style: TextStyle(
                                              fontFamily: 'QuickSand',
                                              fontSize: 18.5,
                                              color: Colors.orange,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          "Ratings: " +
                                              (result.rating?.toString() ??
                                                  "Not Rated"),
                                          style: TextStyle(
                                              fontFamily: 'QuickSand',
                                              fontSize: 15.5,
                                              color: Colors.orange,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        // Text(
                                        //   result.priceLevel.toString(),
                                        //   // "Range: " +
                                        //   //     (result.priceLevel?.toString() ??
                                        //   //         "Not Available"),
                                        //   style: TextStyle(
                                        //       fontSize: 15.5,
                                        //       color: Colors.orange,
                                        //       fontWeight: FontWeight.normal),
                                        // ),
                                        // SizedBox(
                                        //   height: 12,
                                        // ),
                                        ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.0),
                                                  // side: BorderSide(
                                                  //     color:
                                                  //         Colors.red)
                                                )),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.orange)),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  builder: (context) => Booking());

                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //       builder: (context) =>
                                              //           Cart()),
                                              // );
                                            },
                                            child: Text(
                                              " Book a table ",
                                              style: TextStyle(
                                                  fontFamily: 'QuickSand',
                                                  fontSize: 15,
                                                  color: Colors.grey[850]),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ));
                },
                title: result.name,
                snippet:
                    "Ratings: " + (result.rating?.toString() ?? "Not Rated")),
            position: LatLng(
                result.geometry.location.lat, result.geometry.location.lng)))
        .toSet();

    setState(() {
      _markers.addAll(_restaurantMarkers);
    });
  }

  void _currentLocationfix() async {
    //_controller = await _controller.future;
    loc.LocationData currentLocation;
    var location = loc.Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }

    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 12.0,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _currentLocation,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                // The user location returned from the snapshot
                Position snapshotData = snapshot.data;
                LatLng _userLocation =
                    LatLng(snapshotData.latitude, snapshotData.longitude);

                if (_markers.isEmpty) {
                  _retrieveNearbyRestaurants(_userLocation);
                }

                return GoogleMap(
                    myLocationEnabled: true,
                    compassEnabled: true,
                    mapToolbarEnabled: false,
                    myLocationButtonEnabled: false,
                    rotateGesturesEnabled: true,
                    scrollGesturesEnabled: true,
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: true,
                    tiltGesturesEnabled: true,
                    liteModeEnabled: false,
                    trafficEnabled: false,
                    mapType: MapType.normal,
                    onMapCreated: onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _userLocation,
                      zoom: 12,
                    ),
                    markers: _markers
                    // ..add(Marker(
                    //     markerId: MarkerId("User Location"),
                    //     infoWindow: InfoWindow(title: "User Location"),
                    //     position: _userLocation)),
                    );
              } else {
                return Center(child: Text("Failed to get user location."));
              }
            }
            // While the connection is not in the done state yet
            return Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, right: 8),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
            child: FloatingActionButton(
              backgroundColor: Colors.grey.withOpacity(0.21),
              onPressed: _currentLocationfix,

              //label: Text('My Location'),
              child: Icon(
                Icons.my_location_rounded,
                color: Colors.orange,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
