import 'package:bitcoin_price/app/shared/models/text_value.dart';
import 'package:bitcoin_price/app/shared/models/ticker_bitcoin.dart';
import 'package:bitcoin_price/app/shared/repositories/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository repository;

  @observable
  ObservableFuture<TickerBitcoin> tickerBitcoin;

  @observable
  TextValue brlValue = TextValue(
    value: 0,
    oldValue: 0,
  );

  @action
  changeBrlValue() {
    if (brlValue.value != tickerBitcoin.value.bRL.d15m) {
      brlValue.setOldValue(brlValue.value);
      brlValue.setValue(tickerBitcoin.value.bRL.d15m);
      brlValue.setSymbol(tickerBitcoin.value.bRL.symbol);
    }
  }

  @action
  resetOldValue() {
    brlValue.setOldValue(brlValue.value);
  }

  @observable
  _HomeControllerBase(this.repository) {
    fetchBitCoinValue();
  }

  @action
  void fetchBitCoinValue() {
    try {
      tickerBitcoin = repository.getBitcoinValues().asObservable();
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
  }
}
