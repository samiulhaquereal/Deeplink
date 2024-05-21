import 'package:flutter/services.dart';
import 'dart:developer';
import 'package:uni_links/uni_links.dart';

class UniServices {
  static String _code = '';
  static String get code => _code;
  static bool get hasCode => _code.isNotEmpty;

  static void reset() => _code = '';

  static init() async {
    try {
      final Uri? uri = await getInitialUri();
      uniHandler(uri);
    } on PlatformException {
      log("Failed to receive the code");
    } on FormatException {
      log("Wrong format code received");
    }

    uriLinkStream.listen((Uri? uri) async {
      uniHandler(uri);
    }, onError: (error) {
      log("OnUriLink Error: $error");
    });
  }

  static uniHandler(Uri? uri) {
    if (uri == null || uri.queryParameters.isEmpty) return;

    Map<String, String> param = uri.queryParameters;
    String receivedCode = param["code"] ?? ''; // The value of code
  }
}
