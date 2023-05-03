import '../../models/auth/admin_login.dart';
import '../../models/base_model.dart';
import '../../models/error.dart';
import '../network_const.dart';
import '../rest_client.dart';

class AuthRepo extends RestParent{

  Future<BaseModel> adminLogin({
    String? email,
    String? token,
  }) {
    return postReqWithError<AdminLogin,ShasError>(
      endPoint: baseEndPoint,
      resModel: adminLoginFromJson,
      errorModel: errorFromJson,
      queryParams: baseQueries("adminLogin"),
      data: {
        "email":email,
        "firebase_token":token
      },
    );
  }


}