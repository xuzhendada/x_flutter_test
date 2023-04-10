// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseEntity<T> _$ResponseEntityFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ResponseEntity<T>(
      fromJsonT(json['data']),
      json['errCode'] as int?,
      json['errorMsg'] as String?,
    );

Map<String, dynamic> _$ResponseEntityToJson<T>(
  ResponseEntity<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'errCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };
