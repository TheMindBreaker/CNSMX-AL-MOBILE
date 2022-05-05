class WareTransfers {
  WareTransfers({
    required this.error,
    required this.data,
    required this.stack,
  });
  late final bool error;
  late final List<Data> data;
  late final String stack;

  WareTransfers.fromJson(Map<String, dynamic> json){
    error = json['error'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    stack = json['stack'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['error'] = error;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['stack'] = stack;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.originWare,
    required this.destWare,
    required this.productId,
    required this.quantity,
    required this.dateCreated,
    //required this.arrivedDate,
    required this.proDescription,
    required this.proUnit,
    required this.proActualPrice,
    required this.proID,
    required this.wareNameOr,
    required this.wareNameDest,
  });
  late final int id;
  late final int originWare;
  late final int destWare;
  late final int productId;
  late final double quantity;
  late final String dateCreated;
  late final String arrivedDate;
  late final String proDescription;
  late final String proUnit;
  late final double proActualPrice;
  late final String proID;
  late final String wareNameOr;
  late final String wareNameDest;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    originWare = json['originWare'];
    destWare = json['destWare'];
    productId = json['productId'];
    quantity = json['quantity'].toDouble();
    dateCreated = json['dateCreated'];
    json['arrivedDate'] == null ? arrivedDate = '' : arrivedDate = json['arrivedDate'];
    proDescription = json['proDescription'];
    proUnit = json['proUnit'];
    proActualPrice = json['proActualPrice'].toDouble();
    proID = json['proID'];
    wareNameOr = json['wareNameOr'];
    wareNameDest = json['wareNameDest'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['originWare'] = originWare;
    _data['destWare'] = destWare;
    _data['productId'] = productId;
    _data['quantity'] = quantity;
    _data['dateCreated'] = dateCreated;
    _data['arrivedDate'] = arrivedDate;
    _data['proDescription'] = proDescription;
    _data['proUnit'] = proUnit;
    _data['proActualPrice'] = proActualPrice;
    _data['proID'] = proID;
    _data['wareNameOr'] = wareNameOr;
    _data['wareNameDest'] = wareNameDest;
    return _data;
  }
}