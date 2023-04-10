import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'response_entity.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponseEntity<T> {
  @JsonKey(name: 'data')
  T data;
  @JsonKey(name: 'errCode')
  int? errorCode;
  @JsonKey(name: 'errorMsg')
  String? errorMsg;

  ResponseEntity(this.data, this.errorCode, this.errorMsg);

  factory ResponseEntity.fromJson(Map<String, dynamic> json,T Function(Object? json) fromJsonT) =>
      _$ResponseEntityFromJson<T>(json,fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ResponseEntityToJson(this,toJsonT);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
