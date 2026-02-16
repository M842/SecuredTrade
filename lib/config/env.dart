enum AppEnvironment { dev, staging, prod }

class Env {
  Env._();

  static late AppEnvironment _env;

  static void init(AppEnvironment env) {
    _env = env;
  }

  static bool get isProd => _env == AppEnvironment.prod;

  static String get baseUrl {
    switch (_env) {
      case AppEnvironment.dev:
        return 'https://gateway.stbots.io';
      case AppEnvironment.staging:
        return 'https://api-staging.yourapp.com';
      case AppEnvironment.prod:
        return 'https://api.yourapp.com';
    }
  }

  static String get publicKey => isProd ? 'PROD_PUBLIC_KEY' : 'DEV_PUBLIC_KEY';
}
