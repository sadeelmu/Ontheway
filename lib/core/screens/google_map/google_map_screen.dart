import 'dart:async';
import 'package:beltareeq/core/custom_widgets/custom_text.dart';
import 'package:beltareeq/core/enums/map_permision_enum.dart';
import 'package:beltareeq/core/utils/geo_locator_methods.dart';
import 'package:beltareeq/core/utils/map_components.dart';
import 'package:beltareeq/locator.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../container/container_screen_app_bars.dart';
import 'google_map_bloc.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key, required this.view}) : super(key: key);
  final Widget view;

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapBloc bloc = GoogleMapBloc();
  GoogleMapController? controller;
  @override
  void initState() {
    GeolocatorPlatform.instance.getServiceStatusStream().listen((event) {});

    Timer.run(() async {
      await locator<MapComponents>().loadIcon();
      await bloc.getPermission();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarViews(),
      body: Stack(
        children: [
          StreamBuilder<MapPermission>(
              stream: bloc.permissionStatusController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == MapPermission.GRANTED) {
                    return FutureBuilder<Position>(
                        future: locator<GeoLocatorMethods>().getCurrentPosition(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              child: FutureBuilder<Set<Polyline>>(
                                  initialData: {},
                                  future: bloc.drawePolyLines(snapshot.data!),
                                  builder: (context, snapshotPolyLine) {
                                    return GoogleMap(
                                      myLocationButtonEnabled: false,
                                      markers: bloc.drawMarkers(snapshot.data!),
                                      onMapCreated: (camController) {
                                        controller = camController;
                                      },
                                      // polylines: snapshotPolyLine.data!,
                                      initialCameraPosition: CameraPosition(
                                        target:
                                            LatLng((snapshot.data?.latitude ?? 0 + 0.2), (snapshot.data?.longitude) ?? 0 + 0.2),
                                        zoom: 14.4746,
                                      ),
                                    );
                                  }),
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
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 100,
                spreadRadius: 50,
              )
            ]),
            height: 20,
          ),
          widget.view
        ],
      ),
    );
  }
}
