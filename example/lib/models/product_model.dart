import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pars3r/pars3r.dart';

/// Model representing a product in the remote configuration.
///
/// This model contains information about a product, such as its `id`,
/// `name`, `price`, and availability status (`inStock`). It is used to
/// manage product data in remote configurations.
@immutable
final class ProductModel extends IParsableObjectModel<ProductModel> {
  /// Creates a [ProductModel] with the provided properties.
  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.inStock,
  });

  /// Creates an empty [ProductModel] with default values.
  const ProductModel.empty() : this(id: 0, name: '', price: 0, inStock: false);

  /// The unique identifier of the product.
  final int id;

  /// The name of the product.
  final String name;

  /// The price of the product.
  final double price;

  /// The availability status of the product (in stock or not).
  final bool inStock;

  @override
  ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as double,
      inStock: json['inStock'] as bool,
    );
  }

  /// Converts the [ProductModel] to a JSON map.
  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'inStock': inStock,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.inStock == inStock;
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ price.hashCode ^ inStock.hashCode;

  @override
  String toString() {
    const encoder = JsonEncoder.withIndent('');
    final converted = encoder.convert(toJson());
    return converted.replaceAll(RegExp('[{}]'), '');
  }
}
