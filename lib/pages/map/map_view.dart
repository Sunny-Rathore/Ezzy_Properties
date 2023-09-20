import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowMap extends StatefulWidget {
  final String cityName;
  final double lat;
  final double long;
  final double? zoom;
  const ShowMap(
      {super.key,
      required this.lat,
      required this.long,
      required this.cityName,
      this.zoom});

  @override
  State<ShowMap> createState() => _MapViewState();
}

class _MapViewState extends State<ShowMap> {
  @override
  void initState() {
    super.initState();
    // getLatLongFromCityName(widget.cityName);
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(widget.lat, widget.long),
      zoom: widget.zoom ?? 10,
    );
    final List<Marker> markers = [
      Marker(
          markerId: const MarkerId('1'),
          position: LatLng(widget.lat, widget.long),
          infoWindow: InfoWindow(title: widget.cityName)),
    ];
    return Scaffold(
        body: GoogleMap(
      markers: Set<Marker>.of(markers),
      mapType: MapType.normal,
      initialCameraPosition: kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    ));
  }
}
