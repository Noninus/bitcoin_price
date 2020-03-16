import 'package:bitcoin_price/app/modules/home/home_controller.dart';
import 'package:bitcoin_price/app/shared/components/text_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Bitcoin"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();
  NumberFormat formatCurrency;
  @override
  void initState() {
    formatCurrency = NumberFormat.currency(
      symbol: 'R\$',
      locale: 'pt-BR',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Observer(builder: (BuildContext context) {
          if (homeController.tickerBitcoin.error != null) {
            return Center(
                child: Column(
              children: <Widget>[
                Text("${homeController.tickerBitcoin.error}"),
                RaisedButton(
                    onPressed: () => homeController.fetchBitCoinValue())
              ],
            ));
          }

          if (homeController.tickerBitcoin.value == null) {
            return Observer(builder: (_) {
              if (homeController.brlValue.value == 0.0) {
                return Center(child: CircularProgressIndicator());
              }
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${formatCurrency.format(homeController.brlValue.value)}",
                    style: TextStyle(color: Colors.black, fontSize: 50),
                  ),
                  Container(
                      height: 50, width: 50, child: CircularProgressIndicator())
                ],
              ));
            });
          } else {
            homeController.changeBrlValue();

            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextAnimatedWidget(
                    symbol: homeController.brlValue.symbol,
                    begin: homeController.brlValue.oldValue,
                    end: homeController.brlValue.value),
                Container(
                  height: 50,
                  width: 50,
                  child: IconButton(
                      iconSize: 50,
                      icon: Icon(Icons.refresh),
                      onPressed: () => homeController.fetchBitCoinValue()),
                )
              ],
            ));
          }
        }));
  }
}
