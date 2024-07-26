import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/cryptoCurrency.dart';
import 'package:my_flutter_app/network/ResponseModel.dart';

import 'package:my_flutter_app/network/apiProvider.dart';

class CryptoDataProvider extends ChangeNotifier {
  ApiProvider apiProvider = ApiProvider();

  late CryptoCurrency dataCryptoCurrency;
  late Responsemodel state;
  var response;

  getTopMarketCapData() async {
    state = Responsemodel.loading('Is Loading...');

    try {
      response = await apiProvider.getTopMarketCapData();

      if (response.statusCode == 200) {
        dataCryptoCurrency = CryptoCurrency.fromJson(response.data);
        state = Responsemodel.completed(dataCryptoCurrency);
      } else {
        state = Responsemodel.error('Somthing Wrong ...');
      }

      notifyListeners();
    } catch (e) {
      state = Responsemodel.error('Please Check your connection ...');
      notifyListeners();
    }
  }
}
