import 'package:beltareeq/routes.dart';
import 'package:flutter/material.dart';
import 'core/screens/container/container_screen.dart';
import 'core/screens/google_map/google_map_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GoogleMapScreen(view: ContainerScreen()), routes: routes);
  }
}
