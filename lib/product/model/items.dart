import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tagging_plus/flutter_tagging_plus.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:sesimiduy/product/widget/combo_box/product_combo_box.dart';

part 'items.g.dart';

@JsonSerializable()
class Items with ProductDropDownModel, EquatableMixin, TaggableMixin {
  Items({this.id, required this.name});
  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  factory Items.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    if (data == null) {
      throw Exception('Data is null');
    }
    return Items.fromJson(data).copyWith(id: snapshot.id);
  }

  final String? id;

  @override
  final String? name;

  Items fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);

  Items copyWith({
    String? id,
    String? name,
  }) {
    return Items(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  String toString() {
    return 'Items(id: $id, itemName: $name)';
  }

  @override
  List<Object> get props => [id ?? '', name ?? ''];
}
