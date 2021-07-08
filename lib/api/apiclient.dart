import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:piyush_flutter_bloc/lib.dart';

class ApiClient {
  final _baseUrl = 'https://api.github.com/users';
  final _baseUrlBeer = 'https://api.punkapi.com/v2/beers';
  final http.Client httpClient;
  static const int _perPageBeer = 10;

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

  Future<List<BeerModel>> fetchBeers(int page) async {
    var responseJson;

    final url = '$_baseUrlBeer?page=$page&per_page=$_perPageBeer';

    try {
      final response = await this.httpClient.get(Uri.parse(url));
      if (response.statusCode == 200 || response.statusCode == 210) {
        Iterable data = List.from(json.decode(response.body));
        List<BeerModel> result =
            data.map((json) => BeerModel.fromJson(json)).toList();
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
