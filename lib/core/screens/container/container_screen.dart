import 'dart:io';

import 'package:beltareeq/core/custom_widgets/custom_app_bar.dart';
import 'package:beltareeq/core/enums/view_enum.dart';
import 'package:beltareeq/core/screens/destination_page/destination_page_screen.dart';
import 'package:beltareeq/core/screens/dropoff_page/dropoff_page_screen.dart';
import 'package:beltareeq/core/screens/pickup_location/pickup_location_screen.dart';
import 'package:beltareeq/core/screens/ride_options/ride_options_screen.dart';
import 'package:beltareeq/core/utils/view_observer.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../constants/color_constants.dart';

class ContainerScreen extends StatefulWidget {
  ContainerScreen({Key? key}) : super(key: key);

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  ViewObserver viewObserver = locator<ViewObserver>();
  @override
  void initState() {
    viewObserver.viewObserverContoller.stream.listen((event) {
      switch (event) {
        case ViewEnum.DESTENTION:
          viewObserver.views.add(DestinationPageScreen());
          break;
        case ViewEnum.PICK_UP:
          viewObserver.views.add(LocationPickup());
          break;
        case ViewEnum.DROPPOFF:
          viewObserver.views.add(DropoffLocation());
          break;
        case ViewEnum.RIDE_OPTIONS:
          viewObserver.views.add(RideOptionsScreen());
          break;
      }
      viewObserver.rebuildView.sink.add("");
    });
    viewObserver.viewObserverContoller.sink.add(ViewEnum.DESTENTION);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: viewObserver.rebuildView.stream,
        builder: (context, snapshot) {
          if (viewObserver.views.isNotEmpty) {
            return viewObserver.views.last;
          } else {
            return Container();
          }
        });
  }
}
