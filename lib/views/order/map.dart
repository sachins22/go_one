import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPages extends StatelessWidget {
  final LatLng pointA = LatLng(28.6139, 77.2090); // Delhi
  final LatLng pointB = LatLng(
    28.7041,
    77.1025,
  ); // Delhi (slightly different for demo)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OpenStreetMap')),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(initialCenter: pointA, initialZoom: 12.0),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: pointA,
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 36,
                    ),
                  ),
                  Marker(
                    point: pointB,
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.location_pin,
                      color: Colors.blue,
                      size: 36,
                    ),
                  ),
                ],
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [pointA, pointB],
                    strokeWidth: 4.0,
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),

          // Bottom Card
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Route Details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text("From: ${pointA.latitude}, ${pointA.longitude}"),
                      Text("To: ${pointB.latitude}, ${pointB.longitude}"),
                      const SizedBox(height: 8),
                      const Text(
                        "Distance: ~10 km (approx)",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
