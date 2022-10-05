import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../../app.dart';

class SearchMapWidget extends GetView<SearchController> {
  const SearchMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(
              controller.lat.value,
              controller.long.value,
            ),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            )
          ],
        ),
      ),
    );
  }
}
