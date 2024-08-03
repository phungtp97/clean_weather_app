import 'package:flutter_test/flutter_test.dart';
import 'package:josh_weather/core/core.dart';
import 'package:mockito/mockito.dart';

import '../../helper/mocks_helper/mocks.mocks.dart';

main() {
  late MockInternetConnection mockInternetConnection;
  late NetworkInfo mockNetworkInfo;
  setUp(() {
    mockInternetConnection = MockInternetConnection();
    mockNetworkInfo = NetworkInfo(mockInternetConnection);
  });

  test('should return true when the call to dataConnectionChecker is successful', () async {
    when(mockInternetConnection.hasInternetAccess).thenAnswer((_) async => true);

    final result = await mockNetworkInfo.isConnected;
    expect(result, true);
  });
}