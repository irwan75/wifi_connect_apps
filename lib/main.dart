import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:wifi_configuration/wifi_configuration.dart';
import 'package:wifi_connect_apps/view/home.dart';
// import 'package:wifi_connect/wifi_connect.dart';

void main() async {
  await SentryFlutter.init(
    (options) {
      // options.release = "";
      options.environment = "staging";
      options.dsn =
          'https://46cf7354c80542299e3d17bb0f9eee02@o560483.ingest.sentry.io/5696077';
    },
    appRunner: () => runApp(Home()),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String _platformVersion = 'Unknown';

//   void getConnectionState() async {
//     // var listAvailableWifi = await WifiConfiguration.getWifiList();
//     // print("get wifi list : " + listAvailableWifi.toString());
//     WifiConnectionStatus connectionStatus =
//         await WifiConfiguration.connectToWifi(
//             "UkhuwahNet", "umiukhuwah", "com.example.wifi_connect_apps");
//     print("is Connected : ${connectionStatus}");
// //
// //
//     switch (connectionStatus) {
//       case WifiConnectionStatus.connected:
//         print("connected");
//         break;

//       case WifiConnectionStatus.alreadyConnected:
//         print("alreadyConnected");
//         break;

//       case WifiConnectionStatus.notConnected:
//         print("notConnected");
//         break;

//       case WifiConnectionStatus.platformNotSupported:
//         print("platformNotSupported");
//         break;

//       case WifiConnectionStatus.profileAlreadyInstalled:
//         print("profileAlreadyInstalled");
//         break;

//       case WifiConnectionStatus.locationNotAllowed:
//         print("locationNotAllowed");
//         break;
//     }
// //
// //    bool isConnected = await WifiConfiguration.isConnectedToWifi("DBWSN5");
//     // String connectionState = await WifiConfiguration.connectedToWifi();
//     //   print("coneection status ${connectionState}");
//   }
//
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    // getConnectionState();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Connect WiFi"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Column(
              children: [
                MaterialButton(
                  onPressed: () async {
                    // WifiConnect.connect(context,
                    //     password: "umiukhuwah", ssid: "UkhuwahNet");
                    // var connectedTo = WifiConnect.getConnectedSSID(context);
                    // print('Connected to: $connectedTo');
                    //
                    //
                    // WifiConnectionStatus connectionStatus =
                    //     await WifiConfiguration.connectToWifi("EIConcit",
                    //         "fikom2018", "com.example.wifi_connect_apps");
                    // print("is Connected : ${connectionStatus}");
                    // var hasil =
                    //     await WifiConfiguration.isConnectedToWifi("wifi");
                    // print("Hasil Wifi : ${hasil.toString()}");
                    //
                    //
                    //
                    // try {
                    // } catch (exception, stackTrace) {
                    // print("gagal");
                    await Sentry.captureException(
                      "Kegagalan Capturing",
                      stackTrace: "stackTrace",
                    );
                    // }
                  },
                  child: Text("Connect"),
                ),
                Expanded(
                  child: Container(
                    child: GoogleMap(
                      mapType: MapType.hybrid,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
