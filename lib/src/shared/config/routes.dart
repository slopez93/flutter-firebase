import 'package:flutter/material.dart';
import 'package:hoverpayClean/src/presentation/pages/pages.dart';

Map<String, WidgetBuilder> applicationRoutes() {
  return <String, WidgetBuilder>{'login': (_) => LoginPage()};
}
