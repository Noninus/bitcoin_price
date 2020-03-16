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
      symbol: '',
      locale: 'pt-BR',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(builder: (BuildContext context) {
      if (homeController.tickerBitcoin.error != null) {
        return Center(
            child: Column(
          children: <Widget>[
            Text("${homeController.tickerBitcoin.error}"),
            RaisedButton(onPressed: () => homeController.fetchBitCoinValue())
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
              Text(homeController.brlValue.symbol,
                  style: TextStyle(color: Colors.grey, fontSize: 36)),
              Text(
                "${formatCurrency.format(homeController.brlValue.value)}",
                style: TextStyle(color: Colors.black, fontSize: 50),
              ),
              Text(DateFormat.Hm().format(homeController.dateTime),
                  style: TextStyle(color: Colors.grey, fontSize: 24)),
              Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Color(0xFFFF6700)),
                  ))
            ],
          ));
        });
      } else {
        homeController.changeBrlValue();

        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(homeController.brlValue.symbol,
                style: TextStyle(color: Colors.grey, fontSize: 36)),
            TextAnimatedWidget(
                begin: homeController.brlValue.oldValue,
                end: homeController.brlValue.value),
            Text(DateFormat.Hm().format(homeController.dateTime),
                style: TextStyle(color: Colors.grey, fontSize: 24)),
            Container(
              height: 50,
              width: 50,
              child: IconButton(
                  iconSize: 50,
                  color: Color(0xFFFF6700),
                  icon: Icon(Icons.refresh),
                  onPressed: () => homeController.fetchBitCoinValue()),
            )
          ],
        ));
      }
    }));
  }
}
