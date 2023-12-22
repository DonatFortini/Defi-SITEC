import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class Utils {
  static List<CameraDescription> cameras = [];
  static Future<bool> requestCameraPermissions() async {
    PermissionStatus cameraStatus = await Permission.camera.status;

    if (!cameraStatus.isGranted) {
      PermissionStatus newCameraStatus = await Permission.camera.request();

      if (!newCameraStatus.isGranted) {
        return false;
      }
    }

    PermissionStatus storageStatus = await Permission.storage.status;

    if (!storageStatus.isGranted) {
      PermissionStatus newStorageStatus = await Permission.storage.request();
      if (!newStorageStatus.isGranted) {
        return false;
      }
    }

    return true;
  }
}
