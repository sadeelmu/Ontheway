import 'dart:async';

import 'package:beltareeq/core/custom_widgets/custom_text.dart';
import 'package:beltareeq/core/enums/map_permision_enum.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'google_map_bloc.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapBloc bloc = GoogleMapBloc();
  GoogleMapController? controller;
  @override
  void initState() {
    GeolocatorPlatform.instance.getServiceStatusStream().listen((event) {
      print(event);
    });

    Timer.run(() async {
      await bloc.loadIcon();
      print((await GeolocatorPlatform.instance.requestPermission()).name);

      await bloc.getPermission();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<MapPermission>(
          stream: bloc.permissionStatusController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == MapPermission.GRANTED) {
                return FutureBuilder<Position>(
                    future: bloc.getCurrentPosition(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          child: GoogleMap(
                            myLocationButtonEnabled: false,
                            markers: bloc.setMarkers(snapshot.data ??
                                Position(
                                    longitude: 0.0,
                                    latitude: 0.0,
                                    timestamp: DateTime.now(),
                                    accuracy: 0,
                                    altitude: 0,
                                    heading: 0,
                                    speed: 0,
                                    speedAccuracy: 0)),
                            onMapCreated: (camController) {
                              controller = camController;
                            },
                            initialCameraPosition: CameraPosition(
                              target: LatLng(snapshot.data?.latitude ?? 0, snapshot.data?.longitude ?? 0),
                              zoom: 14.4746,
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    });
              } else {
                return Center(
                  child: InkWell(
                    onTap: () async {
                      await Geolocator.openAppSettings();
                    },
                    child: Container(
                      height: 40,
                      width: 120,
                      child: CustomText(
                        title: "Require Permissions",
                        style: null,
                      ),
                    ),
                  ),
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
