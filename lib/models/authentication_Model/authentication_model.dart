class AuthModel {
  String? name;
  List<Item>? item;
  String? id;
  String? uid;

  AuthModel({this.name, this.item, this.id, this.uid});

  AuthModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['item'] != null) {
      item = [];
      json['item'].forEach((v) {
        item!.add(Item.fromJson(v));
      });
    }
    id = json['id'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (item != null) {
      data['item'] = item?.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['uid'] = uid;
    return data;
  }
}

class Item {
  String? name;
  String? id;
  String? uid;

  Item({this.name, this.id, this.uid});

  Item.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['uid'] = uid;
    return data;
  }
}
