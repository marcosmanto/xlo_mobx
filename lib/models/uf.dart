// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UF {
  int? id;
  String? initials;
  String? name;

  UF({
    this.id,
    this.initials,
    this.name,
  });

  UF copyWith({
    int? id,
    String? initials,
    String? name,
  }) {
    return UF(
      id: id ?? this.id,
      initials: initials ?? this.initials,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'initials': initials,
      'name': name,
    };
  }

  factory UF.fromMap(Map<String, dynamic> map) {
    return UF(
      id: map['id'] as int,
      initials: map['sigla'] as String,
      name: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UF.fromJson(String source) =>
      UF.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UF(id: $id, initials: $initials, name: $name)';

  @override
  bool operator ==(covariant UF other) {
    if (identical(this, other)) return true;

    return other.id == id && other.initials == initials && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ initials.hashCode ^ name.hashCode;
}
