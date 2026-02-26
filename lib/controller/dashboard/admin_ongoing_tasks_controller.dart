import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TechnicianLocation {
  final String name;
  final LatLng position;
  final String imagePath;

  TechnicianLocation({
    required this.name,
    required this.position,
    required this.imagePath,
  });
}

class AdminOngoingTasksController extends GetxController {
  late GoogleMapController mapController;
  final markers = Rx<Set<Marker>>({});

  // Mock initial location (e.g., somewhere central)
  final LatLng initialCameraPosition = const LatLng(37.7749, -122.4194);

  final List<TechnicianLocation> technicians = [
    TechnicianLocation(
      name: "Harrison",
      position: const LatLng(37.7799, -122.4294),
      imagePath: "",
    ),
    TechnicianLocation(
      name: "Steve",
      position: const LatLng(37.7849, -122.4194),
      imagePath: "",
    ),
    TechnicianLocation(
      name: "Adam",
      position: const LatLng(37.7799, -122.4094),
      imagePath: "",
    ),
    TechnicianLocation(
      name: "Rachel",
      position: const LatLng(37.7699, -122.4194),
      imagePath: "",
    ),
    TechnicianLocation(
      name: "JOB",
      position: const LatLng(37.7599, -122.4094),
      imagePath: "",
    ),
    TechnicianLocation(
      name: "You",
      position: const LatLng(37.7599, -122.4294),
      imagePath: "",
    ),
  ];

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _generateMarkers();
  }

  Future<void> _generateMarkers() async {
    final Set<Marker> newMarkers = {};
    for (int i = 0; i < technicians.length; i++) {
      final tech = technicians[i];
      final markerIcon = await _getCustomMarker(tech.name);
      newMarkers.add(
        Marker(
          markerId: MarkerId('tech_$i'),
          position: tech.position,
          icon: markerIcon,
        ),
      );
    }
    markers.value = newMarkers;
  }

  Future<BitmapDescriptor> _getCustomMarker(String text) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    const double width = 150;
    const double height = 120; // Enough height for pin + label

    // Draw the main background or keep it transparent
    final Paint pinPaint = Paint()..color = const Color(0xFFA1081A); // App Red

    // Pin shape sizing
    const double pinRadius = 18;
    const double pinX = width / 2;
    const double pinY = 30;

    // Draw Pin
    final Path pinPath = Path();
    pinPath.addArc(
      Rect.fromCircle(center: const Offset(pinX, pinY), radius: pinRadius),
      3.14,
      3.14,
    );
    pinPath.moveTo(pinX - pinRadius, pinY);
    pinPath.lineTo(pinX, pinY + 35); // Pointy tip
    pinPath.lineTo(pinX + pinRadius, pinY);
    pinPath.close();

    canvas.drawPath(pinPath, pinPaint);
    canvas.drawCircle(const Offset(pinX, pinY), pinRadius, pinPaint);

    // Draw inner white circle
    final Paint innerCirclePaint = Paint()..color = Colors.white;
    canvas.drawCircle(
      const Offset(pinX, pinY),
      pinRadius * 0.4,
      innerCirclePaint,
    );

    // Draw white shadow pill
    final Paint pillShadow = Paint()
      ..color = Colors.black.withOpacity(0.15)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    final Paint pillPaint = Paint()..color = Colors.white;

    const double pillWidth = 100;
    const double pillHeight = 35;
    final Rect pillRect = Rect.fromCenter(
      center: Offset(pinX, pinY + 55),
      width: pillWidth,
      height: pillHeight,
    );
    final RRect rrect = RRect.fromRectAndRadius(
      pillRect,
      const Radius.circular(20),
    );

    canvas.drawRRect(rrect.shift(const Offset(0, 3)), pillShadow);
    canvas.drawRRect(rrect, pillPaint);

    // Draw text inside pill
    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
    textPainter.text = TextSpan(
      text: text,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(pinX - textPainter.width / 2, pinY + 55 - textPainter.height / 2),
    );

    final ui.Image image = await pictureRecorder.endRecording().toImage(
      width.toInt(),
      height.toInt(),
    );
    final ByteData? byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    final Uint8List uint8List = byteData!.buffer.asUint8List();

    return BitmapDescriptor.bytes(uint8List);
  }
}
