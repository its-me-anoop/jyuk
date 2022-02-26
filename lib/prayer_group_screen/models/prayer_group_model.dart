import 'package:google_maps_flutter/google_maps_flutter.dart';

class PrayerGroup {
  String prayerGroupName;
  String region;
  String ministry;
  LatLng coordinates;
  MarkerId markerID;
  PrayerGroup(this.prayerGroupName, this.region, this.ministry,
      this.coordinates, this.markerID);
}
