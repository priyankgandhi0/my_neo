import '../../models/base_model.dart';
import '../../models/error.dart';
import '../../models/neo_base_model.dart';
import '../../models/user/create_user_model.dart';
import '../../models/user/get_all_user.dart';
import '../network_const.dart';
import '../rest_client.dart';

class UserRepo extends RestParent {
  Future<BaseModel> getUserList(int page, int currentSelectedValue,
      String? searchText) {
    return postReqWithError<AllUserModel, ShasError>(
      endPoint: baseEndPoint,
      resModel: getAllUserFromJson,
      errorModel: errorFromJson,
      withAuth: true,
      queryParams: baseQueries("getListOfUsers"),
      data: {
        "search_text": searchText,
        "page": page,
        "limit": currentSelectedValue,
      },
    );
  }

  Future<BaseModel> createUser(
      {String? email,
      String? firstName,
      String? lastName,
      String? passWord,
      String? phoneNumber}) {
    return postReqWithError<CreateUserModel, ShasError>(
      endPoint: baseEndPoint,
      resModel: createUserModelFromJson,
      errorModel: errorFromJson,
      withAuth: true,
      queryParams: baseQueries("createUser"),
      data: {
        "email": email,
        "password": passWord,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
      },
    );
  }

  Future<BaseModel> deleteUser({num? uid}) {
    return postReqWithError<NeoBaseModel, ShasError>(
      endPoint: baseEndPoint,
      resModel: neoBaseModelFromJson,
      errorModel: errorFromJson,
      withAuth: true,
      queryParams: baseQueries("deleteUser"),
      data: {
        "uid": uid,
      },
    );
  }

  Future<BaseModel> updateUser({
    num? uid,
    String? email,
    String? firstName,
    String? lastName,
    String? passWord,
    String? phoneNumber,
  }) {
    return postReqWithError<CreateUserModel, ShasError>(
      endPoint: baseEndPoint,
      resModel: createUserModelFromJson,
      errorModel: errorFromJson,
      withAuth: true,
      queryParams: baseQueries("updateUser"),
      data: {
        "uid": uid,
        "email": email,
        "password": passWord,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
      },
    );
  }
}
