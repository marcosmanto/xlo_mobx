// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/uf.dart';

class Address {
  UF uf;
  City city;
  String cep;
  String district;
  Address({
    required this.uf,
    required this.city,
    required this.cep,
    required this.district,
  });

  Address copyWith({
    UF? uf,
    City? city,
    String? cep,
    String? district,
  }) {
    return Address(
      uf: uf ?? this.uf,
      city: city ?? this.city,
      cep: cep ?? this.cep,
      district: district ?? this.district,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uf': uf.toMap(),
      'city': city.toMap(),
      'cep': cep,
      'district': district,
    };
  }

  static UF _mapUFNode(map) {
    if (map.containsKey('uf')) {
      if (map['uf'] is String) {
        return UF(initials: map['uf']);
      } else if (map['uf'] is UF) {
        return map['uf'];
      } else {
        return UF.fromMap(map['uf'] as Map<String, dynamic>);
      }
    } else {
      throw 'Chave UF não encontrada na reposta.';
    }
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      uf: _mapUFNode(map),
      // if we pass a complete city data map the city node to
      // a complete city object, else create a City object only with name.
      city: map.containsKey('city')
          ? (map['city'] is City
              ? map['city']
              : City.fromMap(map['city'] as Map<String, dynamic>))
          : City(name: map['localidade']),
      cep: map['cep'] as String,
      district: map['bairro'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(uf: $uf, city: $city, cep: $cep, district: $district)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;

    return other.uf == uf &&
        other.city == city &&
        other.cep == cep &&
        other.district == district;
  }

  @override
  int get hashCode {
    return uf.hashCode ^ city.hashCode ^ cep.hashCode ^ district.hashCode;
  }
}
