import 'package:beltareeq/core/constants/color_constants.dart';
import 'package:beltareeq/core/constants/routers_constants.dart';
import 'package:beltareeq/core/enums/view_enum.dart';
import 'package:beltareeq/core/utils/custom_map_search_screen.dart';
import 'package:beltareeq/core/utils/view_observer.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../custom_widgets/custom_text.dart';
import 'destination_page_bloc.dart';

class DestinationPageScreen extends StatefulWidget {
  DestinationPageScreen({Key? key}) : super(key: key);

  @override
  State<DestinationPageScreen> createState() => _DestinationPageScreenState();
}

class _DestinationPageScreenState extends State<DestinationPageScreen> {
  DestinationPageBloc bloc = DestinationPageBloc();
  @override
  Widget build(BuildContext context) {
    return CustomMapSearchScreen(
      hasButton: false,
      buttonText: "Confirm PickUp",
      searchHintText: "My location",
      onSearchTap: () {
        locator<ViewObserver>().rebuildViews(ViewEnum.PICK_UP);
      },
    );
  }
}
