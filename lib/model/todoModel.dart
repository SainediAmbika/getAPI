class TodoModel {
  String? title;
  String? dec;
  String? id;

  TodoModel({this.title, this.dec, this.id});

  TodoModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    dec = json["dec"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["dec"] = dec;
    _data["id"] = id;
    return _data;
  }
}
