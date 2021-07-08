import 'package:piyush_flutter_bloc/lib.dart';

class UserRepository {
  final ApiClient apiClient;

  UserRepository({required this.apiClient})
      : assert(apiClient != null);

  Future<List<UserModel>> fetchUsers() async {
    return await apiClient.fetchUsers();
  }
}
