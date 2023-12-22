import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_waste_manager/first_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PermissionStatus status = await Permission.location.request();
  PermissionStatus cameraStatus = await Permission.camera.status;
  final cameras = await availableCameras();
  if (!cameraStatus.isGranted) {
    PermissionStatus newCameraStatus = await Permission.camera.request();

    if (!newCameraStatus.isGranted) {
      print("Permission de l'appareil photo refusée");
      //return false;
    }
  }

  PermissionStatus storageStatus = await Permission.storage.status;

  if (!storageStatus.isGranted) {
    PermissionStatus newStorageStatus = await Permission.storage.request();
    if (!newStorageStatus.isGranted) {
      print("object2");
      //return false;
    }
  }
  if (status.isGranted) {
    // La permission de localisation a été accordée
  } else {
    // La permission de localisation a été refusée
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Waste Manager',
      theme: ThemeData(
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.blue,
          // Nouvelle couleur du fond de la barre
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.red, // Couleur de fond de la BottomNavigationBar
          selectedItemColor: Colors.black, // Couleur des items sélectionnés

          unselectedItemColor: Colors.grey, // Couleur des items non sélectionnés
        ),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent, secondary: Colors.red),
      ),
      home: const MyHomePage(title: 'Smart Waste Manager'),
    );
  }
}
