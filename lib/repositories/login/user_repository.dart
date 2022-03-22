
import '../../models/login/user/user.dart';
import '../../utils/http/http_request.dart';


class UserRepository {
  final String url = "/users/";

  Future<User> getUser() async {
    final user = await HttpRequest.getRequest(
      endpoint: url + "1/",
    );
    return User.fromJson(user);
  }
}
