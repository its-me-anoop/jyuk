import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PrayerGroupsView extends StatelessWidget {
  PrayerGroupsView({Key? key}) : super(key: key);
  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(53.45715964886626, -1.4450157013347806),
    zoom: 20,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapView(kGooglePlex: _kGooglePlex, controller: _controller),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.white10,
                Colors.grey,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: PageView(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: SizedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MapView extends StatelessWidget {
  const MapView({
    Key? key,
    required CameraPosition kGooglePlex,
    required Completer<GoogleMapController> controller,
  })  : _kGooglePlex = kGooglePlex,
        _controller = controller,
        super(key: key);

  final CameraPosition _kGooglePlex;
  final Completer<GoogleMapController> _controller;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      padding: EdgeInsets.only(bottom: 300),
      initialCameraPosition: _kGooglePlex,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      markers: <Marker>{
        //Jesus Youth Center
        const Marker(
            markerId: MarkerId('jy_center'),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(
                title: "Jesus Youth Centre",
                snippet: "St. Charles Presbytery, Sheffield - S9 3WU"),
            position: LatLng(53.45715964886626, -1.4450157013347806)),

        //Aberdeen
        Marker(
            markerId: const MarkerId('aberdeen'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
            infoWindow: const InfoWindow(
                title: "Aberdeen", snippet: "Region: North | Ministry: Nurses"),
            position: const LatLng(57.15416485574878, -2.0948165823652243)),

        //Aylesbury
        Marker(
            markerId: const MarkerId('aylesbury'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueYellow),
            infoWindow: const InfoWindow(
                title: "Aylesbury",
                snippet: "Region: South | Ministry: Nurses, Teens"),
            position: const LatLng(51.817888745605636, -0.807197239023967)),
      },
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
