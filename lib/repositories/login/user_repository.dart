
import '../../models/login/user/user.dart';
import '../../utils/http/http_request.dart';


class UserRepository {
  final String url = "/users/";

  Future<User> getUser() async {
    // ToDo : real request
    final user = await HttpRequest.getRequest(
      endpoint: url + "1/",
    );
    return User.fromJson(user);
  }

  Future<User> postUser({required String email, required String password}) async {
    // ToDo : real request
    return User.empty;
  }
}
