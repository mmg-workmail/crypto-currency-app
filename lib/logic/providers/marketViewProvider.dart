import 'package:flutter/material.dart';
import 'package:my_flutter_app/data/models/CryptoCurrency.dart';
import 'package:my_flutter_app/data/data_source/ResponseModel.dart';
import 'package:my_flutter_app/data/data_source/apiProvider.dart';

class MarketViewprovider extends ChangeNotifier {
  ApiProvider apiProvider = ApiProvider();

  late CryptoCurrency dataCryptoCurrency;
  late ResponseModel state;
  var response;

  getAllCryptoData() async {
    state = ResponseModel.loading('Is Loading...');

    try {
      response = await apiProvider.getAllCryptoData();

      if (response.statusCode == 200) {
        dataCryptoCurrency = CryptoCurrency.fromJson(response.data);
        state = ResponseModel.completed(dataCryptoCurrency);
      } else {
        state = ResponseModel.error('Somthing Wrong ...');
      }

      notifyListeners();
    } catch (e) {
      state = ResponseModel.error(e.toString());
      // state = ResponseModel.error('Please Check your connection ...');
      notifyListeners();
    }
  }
}
