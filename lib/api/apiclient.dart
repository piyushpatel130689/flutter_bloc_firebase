import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../data/models/user_model.dart';

import 'custom_network_exceptions.dart';

class ApiClient {
  final _baseUrl = 'https://api.github.com/users';
  final http.Client httpClient;

  ApiClient({
    required this.httpClient,
  }) : assert(httpClient != null);

  Future<List<UserModel>> fetchUsers() async {
    var responseJson;

    //final url = '$_baseUrl/quotes/random';
    final url = _baseUrl;

    try {
      final response = await this.httpClient.get(Uri.parse(url));
      if (response.statusCode == 200 || response.statusCode == 210) {
        Iterable data = List.from(json.decode(response.body));
        List<UserModel> result =
            data.map((json) => UserModel.fromJson(json)).toList();
        return result;
      } else {
        responseJson = _response(response);
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      // case 200:
      //   var responseJson = json.decode(response.body.toString());
      //   print(responseJson);
      //   return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode: ${response.statusCode}',
        );
    }
  }
}
