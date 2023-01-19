class SearchTextModel {
  int? id;
  String? name;
  String? weight;
  String? quantity;
  int? salePrice;
  int? costPrice;
  String? description;
  String? code;

  SearchTextModel({this.id, this.name,this.weight,this.quantity,this.costPrice,this.salePrice,this.description
  ,this.code});

  SearchTextModel.fromMap(dynamic obj) {
    id = obj['id'];
    name = obj['name'];
    weight = obj['weight'];
    quantity = obj['quantity'].toString();
    costPrice = obj['costPrice'];
    salePrice = obj['salePrice'];
    description = obj['description'];
    code = obj['code'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'weight': weight,
      'quantity': quantity,
      'costPrice': costPrice,
      'salePrice': salePrice,
      'description': description,
      'code': code,
    };

    return map;
  }
}