import 'package:piyush_flutter_bloc/data/models/beer_model.dart';

import '../../api/apiclient.dart';

class BeerRepository {
  final ApiClient apiClient;

  BeerRepository({required this.apiClient}) : assert(apiClient != null);

  Future<List<BeerModel>> fetchBeers({
    required int page,
  }) async {
    return await apiClient.fetchBeers(page);
  }
}
