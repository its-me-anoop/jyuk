import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jyuk/prayer_group_screen/controllers/prayer_group_map_controller.dart';
import 'package:jyuk/prayer_group_screen/data/map_markers.dart';
import 'package:jyuk/prayer_group_screen/data/prayer_groups_list.dart';

generateMarker() {
  final PrayerGroupMapController _prayerGroup =
      Get.put(PrayerGroupMapController());
  markers.clear();
  for (var group in prayerGroups) {
    markers.add(Marker(
        markerId: group.markerID,
        onTap: () {
          _prayerGroup.updateLocationIndex(prayerGroups
              .indexWhere((element) => element.markerID == group.markerID));
          _prayerGroup.prayerGroupPage.value.animateToPage(
              prayerGroups
                  .indexWhere((element) => element.markerID == group.markerID),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        },
        infoWindow: InfoWindow(
            title: group.prayerGroupName,
            snippet: "Region: " +
                group.region +
                " | " +
                "Ministries: " +
                group.ministry),
        position: group.coordinates));
  }
}
