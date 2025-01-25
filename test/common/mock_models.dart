import 'package:pars3r/pars3r.dart';

class MockForceUpdateModel extends IParsableObjectModel<MockForceUpdateModel> {
  const MockForceUpdateModel({
    required this.version,
    required this.forceUpdate,
  });

  const MockForceUpdateModel.empty() : this(version: '', forceUpdate: false);

  final String version;
  final bool forceUpdate;

  @override
  MockForceUpdateModel fromJson(Map<String, dynamic> json) {
    return MockForceUpdateModel(
      version: json['version'] as String,
      forceUpdate: json['force_update'] as bool,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MockForceUpdateModel &&
        other.version == version &&
        other.forceUpdate == forceUpdate;
  }

  @override
  int get hashCode => version.hashCode ^ forceUpdate.hashCode;
}

class MockProduct extends IParsableObjectModel<MockProduct> {
  const MockProduct({
    required this.id,
    required this.name,
    required this.price,
  });

  const MockProduct.empty() : this(id: '', name: '', price: 0);

  final String id;
  final String name;
  final double price;

  @override
  MockProduct fromJson(Map<String, dynamic> json) {
    return MockProduct(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as double,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MockProduct) return false;
    return id == other.id && name == other.name && price == other.price;
  }

  @override
  int get hashCode => Object.hash(id, name, price);
}
