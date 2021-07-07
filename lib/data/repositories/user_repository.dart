
import '../../api/apiclient.dart';
import '../../data/models/user_model.dart';

class UserRepository {
  final ApiClient apiClient;

  UserRepository({required this.apiClient})
      : assert(apiClient != null);

  Future<List<UserModel>> fetchUsers() async {
    return await apiClient.fetchUsers();
  }
}
