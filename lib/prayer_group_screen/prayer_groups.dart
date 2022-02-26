import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jyuk/prayer_group_screen/controllers/prayer_group_map_controller.dart';
import 'package:jyuk/prayer_group_screen/data/map_markers.dart';
import 'package:jyuk/prayer_group_screen/data/prayer_groups_list.dart';
import 'package:jyuk/prayer_group_screen/functions/marker_generator.dart';

class PrayerGroupsView extends StatelessWidget {
  PrayerGroupsView({Key? key}) : super(key: key);

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final PrayerGroupMapController _prayerGroup =
        Get.put(PrayerGroupMapController());
    Future<void> _goToPrayerGroup(index) async {
      GoogleMapController controller = await _controller.future;
      controller.animateCamera(
          CameraUpdate.newLatLngZoom(prayerGroups[index].coordinates, 20));
    }

    generateMarker();
    return Stack(
      children: [
        Obx(() => GoogleMap(
              mapType: MapType.normal,
              padding: const EdgeInsets.only(bottom: 350),
              initialCameraPosition: CameraPosition(
                target: prayerGroups[_prayerGroup.currentLocationIndex.value]
                    .coordinates,
                zoom: 20,
              ),
              myLocationButtonEnabled: false,
              myLocationEnabled: false,
              markers: Set.from(markers),
              onMapCreated: (GoogleMapController controller) async {
                _controller.complete(controller);
              },
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 400,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.transparent,
              Theme.of(context).cardColor.withOpacity(0.1),
              Theme.of(context).cardColor.withOpacity(0.5),
              Theme.of(context).cardColor
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Obx(() => PageView(
                  controller: _prayerGroup.prayerGroupPage.value,
                  onPageChanged: (index) {
                    _prayerGroup.updateLocationIndex(index);
                    _goToPrayerGroup(index);
                  },
                  children: prayerGroups.map((e) {
                    return SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    e.prayerGroupName,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    "Region: " + e.region,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  Text(
                                    "Ministry: " + e.ministry,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )),
          ),
        )
      ],
    );
  }
}
