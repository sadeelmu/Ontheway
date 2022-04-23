import 'package:beltareeq/core/utils/view_observer.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<ViewObserver>(ViewObserver());
}
