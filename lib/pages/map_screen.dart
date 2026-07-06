import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wondervault/utils/colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

int _selectedIndex = 0;
class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();

  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final position = await determinePosition();

      setState(() {
        _currentPosition = position;
      });

      _mapController.move(LatLng(position.latitude, position.longitude), 16);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: const MapOptions(
          cameraConstraint: CameraConstraint.containLatitude(),
          keepAlive: true,
          backgroundColor: Colors.white,
          initialCenter: LatLng(20.5937, 78.9629),
          initialZoom: 5.0,
          minZoom: 3.0,
          maxZoom: 18.0,
          interactionOptions: InteractionOptions(
            flags:
                InteractiveFlag.drag |
                InteractiveFlag.pinchZoom |
                InteractiveFlag.doubleTapZoom,
          ),
        ),
        mapController: _mapController,
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.wondervault',
            tileProvider: NetworkTileProvider(),
            tileBuilder: darkModeTileBuilder,
          ),
          MarkerLayer(
            markers: [
              if (_currentPosition != null)
                Marker(
                  point: LatLng(
                    _currentPosition!.latitude,
                    _currentPosition!.longitude,
                  ),
                  width: 60,
                  height: 60,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Glow
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.withValues(alpha: 0.25),
                        ),
                      ),

                      // White border
                      Container(
                        width: 18,
                        height: 18,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),

                      // Blue center
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () =>
                    launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        child: const Icon(Icons.my_location),
      ),
     appBar: AppBar(
      systemOverlayStyle:  SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,),
  backgroundColor: Colors.transparent,
  elevation: 0,
  scrolledUnderElevation: 0,

  flexibleSpace: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          red,
          aqua,
        ],
      ),
    ),
  ),

  title: Text(
    'WonderVault',
    style: GoogleFonts.bonheurRoyale(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),

  centerTitle: true,

  leading: IconButton(
    icon: const Icon(
      Icons.person_outline_rounded,
      color: Colors.white,
    ),
    onPressed: () {},
  ),
),
      bottomNavigationBar: Container(
        height: 68,
        decoration: BoxDecoration(
          color: const Color(0xFF181818),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
              alignment: _selectedIndex == 0
                  ? const Alignment(-0.52, 0)
                  : const Alignment(0.52, 0),
              child: Transform.translate(
                offset: const Offset(0, -16),
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        red,
                        aqua,
                      ],
                    ),
                    border: Border.all(
                      color: const Color(0xFF181818),
                      width: 6,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: flame.withValues(alpha: 0.35),
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Icon(
                    _selectedIndex == 0
                        ? Icons.map_rounded
                        : Icons.photo_library_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
            
            Row(
              children: [
                _navButton(
                  icon: Icons.map_rounded,
                  label: 'Explore',
                  index: 0,
                ),
                _navButton(
                  icon: Icons.photo_library_rounded,
                  label: 'Memories',
                  index: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _navButton({
    required IconData icon,
  required String label,
  required int index,
}) {
  final isSelected = _selectedIndex == index;

  return Expanded(
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: SizedBox(
        height: 68,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isSelected ? 1 : 0.45,
              child: Column(
                children: [
                  if (!isSelected) ...[
                    SizedBox(height: 15),
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 24,
                  ),
                    const SizedBox(height: 4),
                  ]
                  else...[
                    SizedBox(height: 43),
                  ],
                  
                  Text(
                    label,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
}

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Location services are disabled.');
  }

  // Check permission
  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions are denied.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw Exception(
      'Location permissions are permanently denied. Please enable them from settings.',
    );
  }

  // Get current location
  return await Geolocator.getCurrentPosition(
    locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
  );
}
