import 'dart:async';

import 'package:beltareeq/core/enums/view_enum.dart';
import 'package:flutter/widgets.dart';

class ViewObserver {
  StreamController<ViewEnum> viewObserverContoller = StreamController<ViewEnum>.broadcast();
  StreamController rebuildView = StreamController.broadcast();
  StreamController<ViewEnum> appObserverContoller = StreamController<ViewEnum>.broadcast();
  StreamController appbuildView = StreamController.broadcast();
  List<Widget> views = [];
  List<Widget> appBarViews = [];

  void popScreen() {
    appBarViews.removeLast();
    views.removeLast();
    rebuildView.sink.add("view");
    appbuildView.sink.add("view");
  }

  void rebuildViews(ViewEnum view) {
    appObserverContoller.sink.add(view);
    viewObserverContoller.sink.add(view);
  }
}
