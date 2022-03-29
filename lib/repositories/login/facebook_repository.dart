import '../../models/login/user/user.dart';
import '../../utils/apis/graph_api.dart';

class FacebookRepository {
  final String url = "/v2.12/me";

  Future<User?> getUser({required String token}) async {
    final response = await GraphAPI.getProfile(endpoint: url, query: 'fields=name,first_name,last_name,email&access_token=$token');
    print(response.toString());
    return User.empty;
  }
}
