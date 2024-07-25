import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;
}

@singleton
class NetworkInfo implements INetworkInfo {
  final InternetConnection dataConnectionChecker;

  NetworkInfo(this.dataConnectionChecker);

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasInternetAccess;
}
