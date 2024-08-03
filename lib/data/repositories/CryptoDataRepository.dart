import 'package:my_flutter_app/data/models/CryptoCurrency.dart';
import 'package:my_flutter_app/data/data_source/apiProvider.dart';

class CryptoDataRepository {
  ApiProvider apiProvider = ApiProvider();
  var response;
  late CryptoCurrency dataCryptoCurrency;

  Future<CryptoCurrency> getTopMarketCapData() async {
    response = await apiProvider.getTopMarketCapData();
    dataCryptoCurrency = CryptoCurrency.fromJson(response.data);
    return dataCryptoCurrency;
  }
}
