import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:alerzo_demo/config/appconfig.dart';
import 'package:alerzo_demo/core/error_respons.dart';
import 'package:alerzo_demo/core/post.dart';
import 'package:alerzo_demo/services/http_request.dart';
import 'package:alerzo_demo/utils/string_resources.dart';
import 'package:http/http.dart';

class PostRepository {
  Future<dynamic> getPost() async {
    var responseJson;

    try {
      Response response =
          await HttpService.get('${AppConfig.BASE_URL}${AppConfig.POST_URL}')
              .timeout(
        Duration(seconds: 360),
      );
      responseJson = _postResponse(response);
    } on TimeoutException {
      return SessionError(error: StringResources.TIME_OUT_EXCEPTION);
    } on SocketException {
      return SessionError(error: StringResources.SOCKET_EXCEPTION);
    } on HandshakeException {
      return SessionError(error: StringResources.HANDSHAKE_EXCEPTION);
    }

    return responseJson;
  }
}

dynamic _postResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return List<PostDetail>.from(
          json.decode(response.body).map((x) => PostDetail.fromJson(x)));

    case 307:

    case 400:
      return SessionError(error: StringResources.BAD_REQUEST);

    case 404:
      return SessionError(error: StringResources.NOT_FOUND);
    case 401:
      return SessionError(error: StringResources.SESSION_EXPIRED);
    case 403:
      return SessionError(error: StringResources.OPERATION_FAILED);
    case 500:
    default:
      return SessionError(
          error: StringResources.OPERATION_FAILED_PLEASE_TRY_AGAIN);
  }
}
