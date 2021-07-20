enum BuildMode { dev, staging, prod }

abstract class NetWorkMode {
  final String baseUrl;
  String apiKey;
  String localDBName;
  int connectTimeout;
  int receiveTimeout;
  NetWorkMode.internal(
      {required this.baseUrl,
      required this.apiKey,
      required this.localDBName,
      required this.connectTimeout,
      required this.receiveTimeout});

  factory NetWorkMode({required BuildMode mode}) {
    switch (mode) {
      case BuildMode.prod:
        return ProductionMode();
      case BuildMode.staging:
        return StagingMode();
      case BuildMode.dev:
        return DevelopmentMode();
    }
  }
}

class ProductionMode extends NetWorkMode {
  ProductionMode(
      {String localDBName = 'local.db',
      String baseUrl = 'https://60dd4164878c890017fa2749.mockapi.io/test/v1/',
      String apiKey = 'ff957763c54c44d8b00e5e082bc76cb0',
      int connectTimeout = 30000,
      int receiveTimeout = 30000})
      : super.internal(
            baseUrl: baseUrl,
            apiKey: apiKey,
            localDBName: localDBName,
            connectTimeout: connectTimeout,
            receiveTimeout: receiveTimeout);
}

class StagingMode extends NetWorkMode {
  StagingMode(
      {String localDBName = 'local.db',
      String baseUrl = 'https://60dd4164878c890017fa2749.mockapi.io/test/v1/',
      String apiKey = 'ff957763c54c44d8b00e5e082bc76cb0',
      int connectTimeout = 30000,
      int receiveTimeout = 30000})
      : super.internal(
            baseUrl: baseUrl,
            apiKey: apiKey,
            localDBName: localDBName,
            connectTimeout: connectTimeout,
            receiveTimeout: receiveTimeout);
}

class DevelopmentMode extends NetWorkMode {
  DevelopmentMode(
      {String localDBName = 'local.db',
      String baseUrl = 'https://60dd4164878c890017fa2749.mockapi.io/test/v1/',
      String apiKey = 'ff957763c54c44d8b00e5e082bc76cb0',
      int connectTimeout = 30000,
      int receiveTimeout = 30000})
      : super.internal(
            baseUrl: baseUrl,
            apiKey: apiKey,
            localDBName: localDBName,
            connectTimeout: connectTimeout,
            receiveTimeout: receiveTimeout);
}
