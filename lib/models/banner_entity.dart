import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'banner_entity.g.dart';

@JsonSerializable()
class BannerEntity {
  String? desc;
  int? id;
  String? imagePath;
  int? isVisible;
  int? order;
  String? title;
  int? type;
  String? url;

  BannerEntity();

  factory BannerEntity.fromJson(Map<String, dynamic> json) =>
      _$BannerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BannerEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
