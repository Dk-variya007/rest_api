// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      address: json['Address'] == null
          ? const Address()
          : Address.fromJson(json['Address'] as Map<String, dynamic>),
      addressList: (json['AddressList'] as List<dynamic>?)
              ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'Address': instance.address,
      'AddressList': instance.addressList,
    };

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      street: json['street'] as String? ?? '',
      suite: json['suite'] as String? ?? '',
      city: json['city'] as String? ?? '',
      geo: json['geo'] == null
          ? const Geo()
          : Geo.fromJson(json['geo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'geo': instance.geo,
    };

_$GeoImpl _$$GeoImplFromJson(Map<String, dynamic> json) => _$GeoImpl(
      lat: json['lat'] as String? ?? '',
      lng: json['lng'] as String? ?? '',
    );

Map<String, dynamic> _$$GeoImplToJson(_$GeoImpl instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
