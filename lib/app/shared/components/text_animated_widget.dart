import 'package:bitcoin_price/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class TextAnimatedWidget extends StatefulWidget {
  final String symbol;
  final double begin;
  final double end;
  const TextAnimatedWidget(
      {Key key, this.begin = 1.0, this.end = 0, this.symbol})
      : super(key: key);
  @override
  TextAnimatedWidgetState createState() => TextAnimatedWidgetState();
}

class TextAnimatedWidgetState extends State<TextAnimatedWidget>
    with TickerProviderStateMixin {
  final homeController = Modular.get<HomeController>();
  AnimationController _controller;
  Animation _animation;
  NumberFormat formatCurrency;

  @override
  void initState() {
    super.initState();

    formatCurrency = NumberFormat.currency(
      symbol: widget.symbol,
      locale: 'pt-BR',
    );
    _controller = AnimationController(
        vsync: this,
        duration: widget.begin == widget.end || widget.begin == 0
            ? Duration(seconds: 0)
            : Duration(seconds: 2));

    _animation =
        Tween(begin: widget.begin, end: widget.end).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
    _controller.forward();

    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        homeController.resetOldValue();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Text(
            "${formatCurrency.format(_animation.value)}",
            style: TextStyle(
                color: _controller.status != AnimationStatus.completed
                    ? widget.begin - widget.end > 0 ? Colors.red : Colors.green
                    : Colors.black,
                fontSize: 50),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
