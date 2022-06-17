import 'Name.dart';

class DataModel {
  DataModel({this.categoryId,
    this.name,
    this.slug,
    this.description,
    this.parentID,
    this.type,
    this.attributeSet,
    this.categoryNumber,
    this.level,
    this.featured,
    this.icon,
    this.image,
    this.status,
    this.createDate,
    this.children,
    this.isCustom,
  });

  late final List<DataModel>? children;
  late final String? categoryId;
  late final List<Name>? name;
  late final String? slug;
  late final String? description;
  late final String? parentID;
  late final int? type;
  late final String? attributeSet;
  late final int? categoryNumber;
  late final int? level;
  late final bool? featured;
  late final String? icon;
  late final List<dynamic>? image;
  late final bool? status;
  late final String? createDate;
  bool? isCustom = false;




  DataModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    name = List.from(json['name']).map((e) => Name.fromJson(e)).toList();
    slug = json['slug'];
    description = json['description'];
    parentID = json['parentID'];
    type = json['type'];
    attributeSet = json['attributeSet'];
    categoryNumber = json['categoryNumber'];
    level = json['level'];
    featured = json['featured'];
    icon = json['icon'];
    image = List.castFrom<dynamic, dynamic>(json['image']);
    status = json['status'];
    isCustom = json['isCustom'];
    createDate = json['create_date'];
    children =json['children'] == null
        ? null : List.of(json['children']);

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['categoryId'] = categoryId;
    _data['name'] = name?.map((e) => e.toJson()).toList();
    _data['slug'] = slug;
    _data['description'] = description;
    _data['parentID'] = parentID;
    _data['type'] = type;
    _data['attributeSet'] = attributeSet;
    _data['categoryNumber'] = categoryNumber;
    _data['level'] = level;
    _data['featured'] = featured;
    _data['icon'] = icon;
    _data['image'] = image;
    _data['status'] = status;
    _data['isCustom'] = isCustom;
    _data['create_date'] = createDate;
    _data['children'] = children?.map((e) => e.toJson()).toList();
    return _data;
  }
}
