import 'dart:convert';

TextValue textValueFromJson(String str) => TextValue.fromJson(json.decode(str));

String textValueToJson(TextValue data) => json.encode(data.toJson());

class TextValue {
  double oldValue;
  double value;
  String symbol;

  TextValue({
    this.oldValue,
    this.value,
    this.symbol,
  });

  setOldValue(double oldValue) {
    this.oldValue = oldValue;
  }

  setValue(double value) {
    this.value = value;
  }

  setSymbol(String symbol) {
    this.symbol = symbol;
  }

  factory TextValue.fromJson(Map<String, dynamic> json) => TextValue(
        oldValue: json["oldValue"],
        value: json["value"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "oldValue": oldValue,
        "value": value,
        "symbol": symbol,
      };
}
