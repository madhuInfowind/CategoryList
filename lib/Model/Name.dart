class Name {
  Name({
     this.id,
     this.language,
     this.value,
  });
  late final String? id;
  late final String? language;
  late final String? value;

  Name.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    language = json['language'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['language'] = language;
    _data['value'] = value;
    return _data;
  }
}
