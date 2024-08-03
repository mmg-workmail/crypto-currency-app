import 'package:flutter/material.dart';
import 'package:my_flutter_app/data/models/CryptoCurrency.dart';
import 'package:my_flutter_app/data/data_source/ResponseModel.dart';
import 'package:my_flutter_app/data/data_source/apiProvider.dart';
import 'package:my_flutter_app/data/repositories/CryptoDataRepository.dart';

class CryptoDataProvider extends ChangeNotifier {
  ApiProvider apiProvider = ApiProvider();

  late CryptoCurrency dataCryptoCurrency;
  late ResponseModel state;
  var response;

  var defaultChoiceIndex = 0;

  CryptoDataRepository repository = CryptoDataRepository();

  CryptoDataProvider() {
    getTopMarketCapData();
  }

  getTopMarketCapData() async {
    defaultChoiceIndex = 0;
    state = ResponseModel.loading('Is Loading...');
    notifyListeners();

    try {
      // response = await apiProvider.getTopMarketCapData();

      // if (response.statusCode == 200) {
      //   dataCryptoCurrency = CryptoCurrency.fromJson(response.data);
      //   state = ResponseModel.completed(dataCryptoCurrency);
      // } else {
      //   state = ResponseModel.error('Somthing Wrong ...');
      // }

      dataCryptoCurrency = await repository.getTopMarketCapData();
      state = ResponseModel.completed(dataCryptoCurrency);
      // state = ResponseModel.error('Somthing Wrong ...');

      notifyListeners();
    } catch (e) {
      state = ResponseModel.error(e.toString());
      // state = ResponseModel.error('Please Check your connection ...');
      notifyListeners();
    }
  }

  getTopGainersData() async {
    defaultChoiceIndex = 1;
    state = ResponseModel.loading('Is Loading...');
    notifyListeners();

    try {
      response = await apiProvider.getTopGainersData();

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

  getTopLosersData() async {
    defaultChoiceIndex = 2;
    state = ResponseModel.loading('Is Loading...');
    notifyListeners();

    try {
      response = await apiProvider.getTopLosersData();

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
