import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:buffer/controller/url_and_headers/url_and_headers.dart';
import 'package:http/http.dart' as http;

class RegistrationService {
  static Future registerUser(
    String username,
    String email,
    String userId,
    String ayrshareToken,
    String organization,
  ) async {
    try {
      var body = jsonEncode(headersJson);
      var response =
          await http.post(registerUserURL, headers: headersJson).timeout(
        const Duration(seconds: 60),
        onTimeout: () {
          throw TimeoutException('Connection Time Out');
        },
      );
      if (response.statusCode == 200) {
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }

  static Future checkRegistration(
    String userId,
  ) async {
    try {
      // var body = jsonEncode(headersJson);
      var response = await http
          .post(
        checkRegistrationURL,
        headers: headersJson,
      )
          .timeout(
        const Duration(seconds: 60),
        onTimeout: () {
          throw TimeoutException('Connection Time Out');
        },
      );
      if (response.statusCode == 200) {
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }
}
