import 'package:flutter/material.dart';
import 'package:my_flutter_app/data/models/ErrorModel.dart';
import 'package:my_flutter_app/data/models/User.dart';
import 'package:my_flutter_app/data/data_source/ResponseModel.dart';
import 'package:my_flutter_app/data/data_source/apiProvider.dart';

class UserViewProvider extends ChangeNotifier {
  ApiProvider apiProvider = ApiProvider();

  late dynamic dataUser;
  ResponseModel? state;
  var loginStatus;
  var error;
  var response;

  callRegisterApi(name, email, password) async {
    state = ResponseModel.loading('Is Loading...');
    notifyListeners();

    try {
      response = await apiProvider.callRegisterApi(name, email, password);
      print(response);
      print(response.statusCode);
      if (response.statusCode == 201) {
        dataUser = User.fromJson(response.data);
        state = ResponseModel.completed(dataUser);
      } else {
        dataUser = ErrorModel.fromJson(response.data);
        state = ResponseModel.error(dataUser.message);
      }

      notifyListeners();
    } catch (e) {
      state = ResponseModel.error(e.toString());
      // state = ResponseModel.error('Please Check your connection ...');
      notifyListeners();
    }
  }
}
