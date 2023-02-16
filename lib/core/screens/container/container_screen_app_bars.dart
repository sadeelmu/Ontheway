import 'package:beltareeq/core/constants/routers_constants.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../constants/color_constants.dart';
import '../../custom_widgets/custom_app_bar.dart';
import '../../enums/view_enum.dart';
import '../../utils/view_observer.dart';
import 'container_screen.dart';

class AppBarViews extends StatefulWidget implements PreferredSizeWidget {
  const AppBarViews({Key? key}) : super(key: key);

  @override
  State<AppBarViews> createState() => _AppBarViewsState();

  @override
  Size get preferredSize => Size.fromHeight(150);
}

class _AppBarViewsState extends State<AppBarViews> {
  ViewObserver viewObserver = locator<ViewObserver>();

  @override
  void initState() {
    viewObserver.appObserverContoller.stream.listen((event) {
      switch (event) {
        case ViewEnum.DESTENTION:
          viewObserver.appBarViews.add(BaseAppBar(
            firstText: "Good morning",
            coloresfirstText: "User, ",
            isToLined: true,
            firstTextColor: Colors.black,
            hasBackIcon: false,
            secondeText: "Where are you going?",
            secondeTextColor: Colors.black,
            avatarColor: ColorConstants.color_0xff1A5AD9,
            iconColor: ColorConstants.color_0xffffffff,
            backgroundColor: ColorConstants.color_0xffffffff,
            coloredfirstTextColor: ColorConstants.color_0xff1A5AD9,
          ));
          break;
        case ViewEnum.PICK_UP:
          viewObserver.appBarViews.add(BaseAppBar(
              leadingActionTap: () {
                viewObserver.popScreen();
              },
              backgroundColor: ColorConstants.color_0xffffffff,
              coloredfirstTextColor: ColorConstants.color_0xff1A5AD9,
              isToLined: false,
              secondeText: "Pick Up Location ",
              secondeTextColor: Colors.black,
              avatarColor: ColorConstants.color_0xff1A5AD9,
              iconColor: ColorConstants.color_0xffffffff,
              hasBackIcon: true));
          break;
        case ViewEnum.DROPPOFF:
          viewObserver.appBarViews.add(BaseAppBar(
              leadingActionTap: () {
                viewObserver.popScreen();
              },
              backgroundColor: ColorConstants.color_0xffffffff,
              coloredfirstTextColor: ColorConstants.color_0xff1A5AD9,
              isToLined: false,
              secondeText: "Drop Off Location",
              secondeTextColor: Colors.black,
              avatarColor: ColorConstants.color_0xff1A5AD9,
              iconColor: ColorConstants.color_0xffffffff,
              hasBackIcon: true));
          break;
        case ViewEnum.RIDE_OPTIONS:
          viewObserver.appBarViews.add(BaseAppBar(
              leadingActionTap: () {
                Navigator.pushNamed(
                        context, RoutesConstants.location_search_page)
                    .then((value) {
                  if (value == true) {
                    viewObserver.appObserverContoller.sink
                        .add(ViewEnum.RIDE_OPTIONS);
                    viewObserver.viewObserverContoller.sink
                        .add(ViewEnum.RIDE_OPTIONS);
                  }
                });
                viewObserver.popScreen();
              },
              backgroundColor: ColorConstants.color_0xffffffff,
              coloredfirstTextColor: ColorConstants.color_0xff1A5AD9,
              coloresfirstText: "User",
              isToLined: true,
              secondeText: "Choose The Best Price",
              secondeTextColor: Colors.black,
              avatarColor: ColorConstants.color_0xff1A5AD9,
              iconColor: ColorConstants.color_0xffffffff,
              hasBackIcon: true));
          break;
        case ViewEnum.START_RIDE:
          viewObserver.appBarViews.add(BaseAppBar(
              leadingActionTap: () {
                viewObserver.popScreen();
              },
              backgroundColor: ColorConstants.color_0xffffffff,
              coloredfirstTextColor: locator<ViewObserver>().comColor,
              firstTextColor: Colors.black,
              coloresfirstText: "${locator<ViewObserver>().compName} Driver, ",
              firstText: "will be at your",
              isToLined: true,
              secondeText: "place in 5 minutes",
              secondeTextColor: Colors.black,
              avatarColor: ColorConstants.color_0xff1A5AD9,
              iconColor: ColorConstants.color_0xffffffff,
              hasBackIcon: true));
          break;
        case ViewEnum.FINISH_RIDE:
          viewObserver.appBarViews.add(BaseAppBar(
            leadingActionTap: () {
              viewObserver.popScreen();
            },
            isToLined: false,
            firstTextColor: Colors.black,
            hasBackIcon: true,
            secondeText: "Finished",
            secondeTextColor: Colors.black,
            avatarColor: ColorConstants.color_0xff1A5AD9,
            iconColor: ColorConstants.color_0xffffffff,
            backgroundColor: ColorConstants.color_0xffffffff,
            coloredfirstTextColor: ColorConstants.color_0xff1A5AD9,
          ));
          break;
      }
      viewObserver.appbuildView.sink.add("event");
    });
    viewObserver.appObserverContoller.sink.add(ViewEnum.DESTENTION);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: viewObserver.appbuildView.stream,
        builder: (context, snapshot) {
          if (viewObserver.appBarViews.isNotEmpty) {
            return viewObserver.appBarViews.last;
          } else {
            return Container();
          }
        });
  }
}
