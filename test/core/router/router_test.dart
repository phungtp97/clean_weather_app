import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:josh_weather/core/core.dart';
import 'package:josh_weather/feature/presentation/pages/pages.dart';


main() {
  test('should return NotFoundPage when the route is not found', () {
    final PageRoute result = Routes.getRoute(const RouteSettings(name: Routes.home));

    expect(result, isA<CupertinoPageRoute>());
    expect((result as CupertinoPageRoute).title, const NotFoundPage().runtimeType.toString());
  });
}
