import 'package:bitcoin_price/app/shared/models/ticker_bitcoin.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  final Dio dio;

  HomeRepository(this.dio);

  Future<TickerBitcoin> getBitcoinValues() async {
    // final ILocalStorage storage = Modular.get();
    // String sessao = await storage.get('sessaoGuidId');
    var response = await dio.get('/ticker');
    TickerBitcoin ticker = TickerBitcoin.fromJson(response.data);

    print(' *** GET BITCOIN VALUES ***');
    print(response.data);
    return ticker;
  }
}
