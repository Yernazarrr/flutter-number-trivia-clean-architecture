import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:numbers_app/core/network/network_info.dart';

import 'network_info_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetConnection>()])
void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnection mockInternetConnection;

  setUp(() {
    mockInternetConnection = MockInternetConnection();
    networkInfo = NetworkInfoImpl(mockInternetConnection);
  });

  group('isConnected', () {
    test(
      'should delegate the call to InternetConnection.hasInternetAccess',
      () async {
        when(
          mockInternetConnection.hasInternetAccess,
        ).thenAnswer((_) async => true);

        final result = await networkInfo.isConnected;

        verify(mockInternetConnection.hasInternetAccess);
        expect(result, true);
      },
    );
  });
}
