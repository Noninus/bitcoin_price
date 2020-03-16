class TickerBitcoin {
  USD uSD;
  USD jPY;
  USD cNY;
  USD sGD;
  USD hKD;
  USD cAD;
  USD nZD;
  USD aUD;
  USD cLP;
  USD gBP;
  USD dKK;
  USD sEK;
  USD iSK;
  USD cHF;
  USD bRL;
  USD eUR;
  USD rUB;
  USD pLN;
  USD tHB;
  USD kRW;
  USD tWD;

  TickerBitcoin(
      {this.uSD,
      this.jPY,
      this.cNY,
      this.sGD,
      this.hKD,
      this.cAD,
      this.nZD,
      this.aUD,
      this.cLP,
      this.gBP,
      this.dKK,
      this.sEK,
      this.iSK,
      this.cHF,
      this.bRL,
      this.eUR,
      this.rUB,
      this.pLN,
      this.tHB,
      this.kRW,
      this.tWD});

  TickerBitcoin.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? new USD.fromJson(json['USD']) : null;
    jPY = json['JPY'] != null ? new USD.fromJson(json['JPY']) : null;
    cNY = json['CNY'] != null ? new USD.fromJson(json['CNY']) : null;
    sGD = json['SGD'] != null ? new USD.fromJson(json['SGD']) : null;
    hKD = json['HKD'] != null ? new USD.fromJson(json['HKD']) : null;
    cAD = json['CAD'] != null ? new USD.fromJson(json['CAD']) : null;
    nZD = json['NZD'] != null ? new USD.fromJson(json['NZD']) : null;
    aUD = json['AUD'] != null ? new USD.fromJson(json['AUD']) : null;
    cLP = json['CLP'] != null ? new USD.fromJson(json['CLP']) : null;
    gBP = json['GBP'] != null ? new USD.fromJson(json['GBP']) : null;
    dKK = json['DKK'] != null ? new USD.fromJson(json['DKK']) : null;
    sEK = json['SEK'] != null ? new USD.fromJson(json['SEK']) : null;
    iSK = json['ISK'] != null ? new USD.fromJson(json['ISK']) : null;
    cHF = json['CHF'] != null ? new USD.fromJson(json['CHF']) : null;
    bRL = json['BRL'] != null ? new USD.fromJson(json['BRL']) : null;
    eUR = json['EUR'] != null ? new USD.fromJson(json['EUR']) : null;
    rUB = json['RUB'] != null ? new USD.fromJson(json['RUB']) : null;
    pLN = json['PLN'] != null ? new USD.fromJson(json['PLN']) : null;
    tHB = json['THB'] != null ? new USD.fromJson(json['THB']) : null;
    kRW = json['KRW'] != null ? new USD.fromJson(json['KRW']) : null;
    tWD = json['TWD'] != null ? new USD.fromJson(json['TWD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uSD != null) {
      data['USD'] = this.uSD.toJson();
    }
    if (this.jPY != null) {
      data['JPY'] = this.jPY.toJson();
    }
    if (this.cNY != null) {
      data['CNY'] = this.cNY.toJson();
    }
    if (this.sGD != null) {
      data['SGD'] = this.sGD.toJson();
    }
    if (this.hKD != null) {
      data['HKD'] = this.hKD.toJson();
    }
    if (this.cAD != null) {
      data['CAD'] = this.cAD.toJson();
    }
    if (this.nZD != null) {
      data['NZD'] = this.nZD.toJson();
    }
    if (this.aUD != null) {
      data['AUD'] = this.aUD.toJson();
    }
    if (this.cLP != null) {
      data['CLP'] = this.cLP.toJson();
    }
    if (this.gBP != null) {
      data['GBP'] = this.gBP.toJson();
    }
    if (this.dKK != null) {
      data['DKK'] = this.dKK.toJson();
    }
    if (this.sEK != null) {
      data['SEK'] = this.sEK.toJson();
    }
    if (this.iSK != null) {
      data['ISK'] = this.iSK.toJson();
    }
    if (this.cHF != null) {
      data['CHF'] = this.cHF.toJson();
    }
    if (this.bRL != null) {
      data['BRL'] = this.bRL.toJson();
    }
    if (this.eUR != null) {
      data['EUR'] = this.eUR.toJson();
    }
    if (this.rUB != null) {
      data['RUB'] = this.rUB.toJson();
    }
    if (this.pLN != null) {
      data['PLN'] = this.pLN.toJson();
    }
    if (this.tHB != null) {
      data['THB'] = this.tHB.toJson();
    }
    if (this.kRW != null) {
      data['KRW'] = this.kRW.toJson();
    }
    if (this.tWD != null) {
      data['TWD'] = this.tWD.toJson();
    }
    return data;
  }
}

class USD {
  double d15m;
  double last;
  double buy;
  double sell;
  String symbol;

  USD({this.d15m, this.last, this.buy, this.sell, this.symbol});

  USD.fromJson(Map<String, dynamic> json) {
    d15m = json['15m'];
    last = json['last'];
    buy = json['buy'];
    sell = json['sell'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['15m'] = this.d15m;
    data['last'] = this.last;
    data['buy'] = this.buy;
    data['sell'] = this.sell;
    data['symbol'] = this.symbol;
    return data;
  }
}
