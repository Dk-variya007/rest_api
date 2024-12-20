
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    @Default(0) @JsonKey(name: 'id') int id,
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'username') String username,
    @Default('') @JsonKey(name: 'email') String email,
    @Default(Address()) @JsonKey(name: 'Address') Address address,//for { address:{} }
    @Default([]) @JsonKey(name: 'AddressList') List<Address> addressList,//for { address:[{},{}]}
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    @Default('') @JsonKey(name: 'street') String street,
    @Default('') @JsonKey(name: 'suite') String suite,
    @Default('') @JsonKey(name: 'city') String city,
    @Default(Geo()) @JsonKey(name: 'geo') Geo geo
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
class Geo with _$Geo {
  const factory Geo({
    @Default('') @JsonKey(name: 'lat') String lat,
    @Default('') @JsonKey(name: 'lng') String lng,
  }) = _Geo;

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}
