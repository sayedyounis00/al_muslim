import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Location {
  static bool hasPermision = false;
  static bool isEnabel = false;

  Future<void> getPermision() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermision = true;
      } else {
        Permission.location.request().then((val) {
          hasPermision = (val == PermissionStatus.granted);
        });
      }
    }
  }

  //?Ask user to give the application the location access
  Future<LocationPermission> requestPermission() async {
    LocationPermission permision = await Geolocator.requestPermission();
    return permision;
  }

//?make sure location is active if Not send to setting to activate
  Future<void> openLocationSettings() async {
    isEnabel = await Geolocator.isLocationServiceEnabled();
    if (!isEnabel) {
      await Geolocator.openLocationSettings();
    }
  }

  //?to get current location after checking of location is activate
  Future<Position?> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    bool isEnabel = await Geolocator.isLocationServiceEnabled();
    if (isEnabel &&
        (permission == LocationPermission.whileInUse ||
            permission == LocationPermission.always)) {
      Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.best,
      );
      return position;
    } else {
      await openLocationSettings();
      return null;
    }
  }
}

//to get a certin Location like your countryName,etc...
class GetLocationData {
  Future<List<Placemark>> getLocation({required Position? position}) async {
    final List<Placemark> placeMark = await placemarkFromCoordinates(
      position!.latitude,
      position.longitude,
    );
    return placeMark;
  }
}

class FinalLoc {
  static Future<String> getLoc() async {
    Position? pos = await Location().getCurrentLocation();
    if (pos != null) {
      List<Placemark> curLoc =
          await GetLocationData().getLocation(position: pos);
      //return basyon
      return curLoc.first.subAdministrativeArea!;
    }
    return 'فشل تحديد موقعك';
  }
}
