import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'response_entity.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponseEntity<T> {
  @JsonKey(name: 'data')
  T? data;
  @JsonKey(name: 'errCode')
  int? errorCode;
  @JsonKey(name: 'errorMsg')
  String? errorMsg;

  ResponseEntity(this.data, this.errorCode, this.errorMsg);

  factory ResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseEntityFromJson<T>(json);

  Map<String, dynamic> toJson() =>
      _$ResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
