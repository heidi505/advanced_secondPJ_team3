import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  static Future<bool> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      // Permission.storage,
      Permission.contacts,
      Permission.phone,
    ].request();

    return
      // statuses[Permission.storage] == PermissionStatus.granted &&
        statuses[Permission.contacts] == PermissionStatus.granted &&
        statuses[Permission.phone] == PermissionStatus.granted;
  }
}