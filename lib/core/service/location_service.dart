import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position?> getLocation() async {
    try {
      
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('❌ Location services are disabled.');
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('❌ Location permissions are denied.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            '❌ Location permissions are permanently denied, please enable them from settings.');
      }

      // الحصول على الموقع بعد التأكد من الإذن والخدمة
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      print("⚠️ Error getting location: $e");
      return Future.error("⚠️ Failed to get location: $e");
    }
  }
}
