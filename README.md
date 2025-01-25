# Pars3r

Pars3r is a Dart library designed to facilitate the parsing of `String` values into various object types. It provides a flexible and extensible framework for handling both primitive types and enums, ensuring type safety and ease of use in your Dart applications.

## Motivation
Managing diverse data types like `String`, `int`, `bool`, `double`, `enum`, `object`, and even `lists of objects` from sources like `Firebase Remote Config` or custom APIs can quickly become complex and error-prone. Manually handling these types often leads to repetitive code and potential bugs.

Pars3r solves this challenge by offering a unified framework for parsing and managing various data types. It ensures simplicity, type safety, and scalability in your Dart applications, making it easier to work with data from multiple sources seamlessly.


## Example Usage
-  The complete `example` can be found in the [example](example) directory.

### 1. Basic Usage with Firebase Remote Config
Pars3r allows you to extend your Firebase Remote Config service with the IParsableService interface. Below is an example implementation:

```dart
class FirebaseRemoteConfigService with IParsableService {
  Future<bool> initialize() async {
    await _remoteConfig.fetchAndActivate();
    return _remoteConfig.lastFetchStatus == RemoteConfigFetchStatus.success;
  }

  R read<T extends IParsableModel<T>, R>({
    required String key,
    required T parseModel,
  }) {
    final stringValue = _remoteConfig.getString(key);
    return super.parser<T, R>(parseModel, stringValue);
  }
}
```

You can then use this service to parse different data types:

```dart
final service = FirebaseRemoteConfigService();
await service.initialize();

final version = service.read<String, String>(
  key: 'version', 
  parseModel: ParsablePrimitiveModel<String>(''),
);
print(version); // "1.0.0"
````

### 2. Managing Multiple Remote Items
For better maintainability, you can define a centralized enum for all your remote configuration keys:

```dart
enum RemoteItem<T extends IParsableModel<T>, R> {
  welcomeMessage<ParsablePrimitiveModel<String>, ParsablePrimitiveModel<String>>(),
  appTheme<ParsableEnumModel<AppTheme>, ParsableEnumModel<AppTheme>>(),
  maxRetryCount<ParsablePrimitiveModel<int>, ParsablePrimitiveModel<int>>(),
  isPromoEnabled<ParsablePrimitiveModel<bool>, ParsablePrimitiveModel<bool>>(),
  percentage<ParsablePrimitiveModel<double>, ParsablePrimitiveModel<double>>(),
  forceUpdate<ForceUpdateModel, ForceUpdateModel>(),
  products<ProductModel, List<ProductModel>>(),
  ;

  /// Fetches the remote configuration value associated with this enum item.
  ///
  /// If an error occurs during fetching, it logs the error and returns
  /// a default value based on the type (`empty`).
  R get read {
    try {
      return remoteConfigService.read<T, R>(
        key: name.toSnakeCase(),
        parseModel: _empty,
      );
    } catch (error) {
      debugPrint('RemoteItems.value: $error');
      if (R == List<T>) return [_empty] as R;
      return _empty as R;
    }
  }

  /// Returns a default value for the remote configuration item.
  T get _empty {
    return switch (this) {
      RemoteItem.welcomeMessage => ParsablePrimitiveModel<String>.empty(),
      RemoteItem.appTheme => const ParsableEnumModel(AppTheme.dark),
      RemoteItem.maxRetryCount => ParsablePrimitiveModel<int>.empty(),
      RemoteItem.isPromoEnabled => ParsablePrimitiveModel<bool>.empty(),
      RemoteItem.percentage => ParsablePrimitiveModel<double>.empty(),
      RemoteItem.forceUpdate => const ForceUpdateModel.empty(),
      RemoteItem.products => const ProductModel.empty(),
    } as T;
  }
}
```

Using the above enum:

```dart 
final welcomeMessage = RemoteItem.welcomeMessage.read; // "Welcome to Pars3r"
final appTheme = RemoteItem.appTheme.read; // AppTheme.dark
final maxRetryCount = RemoteItem.maxRetryCount.read; // 3
final isPromoEnabled = RemoteItem.isPromoEnabled.read; // true
final percentage = RemoteItem.percentage.read; // 0.5
final forceUpdate = RemoteItem.forceUpdate.read; // ForceUpdateModel(version: '1.0.0', forceUpdate: true)
final products = RemoteItem.products.read; // [ProductModel(name: 'Product 1', price: 100.0)]
```

---


## Features
### Abstract Models

- `IParsableModel`: A base interface for models that can parse String values into objects of a specified type.

- `IParsablePrimitiveModel`: Abstract mixin for parsing primitive types such as int, bool, and double.

- `IParsableEnumModel`: Specialized interface for enums that can be parsed from String values.

- `IParsableObjectModel`: Abstract mixin for parsing complex JSON objects.


### Concrete Models

- `ParsablePrimitiveModel`: A concrete implementation for parsing primitive types.

- `ParsableEnumModel`: A concrete implementation for parsing enums.

### Parsing Service

- `IParsableService`: Provides a parsing mechanism for models, supporting single objects and lists.

--- 

## Model Definitions

### 1. Primitive Types

You can use the ready-made models for `String`, `int`, `double`, and `bool`, or create your own models.

### 2. Enums


```dart
enum TestEnum with IParsableEnum<TestEnum> { 
  first, 
  second, 
  third,
  ;

  @override
  List<TestEnum> get enumValues => values;
}
```

### 3. Complex Objects

```dart
class ForceUpdateModel extends IParsableObjectModel<ForceUpdateModel> {
  const ForceUpdateModel({
    required this.version,
    required this.forceUpdate,
  });

  const ForceUpdateModel.empty() : this(version: '', forceUpdate: false);

  final String version;
  final bool forceUpdate;

  @override
  ForceUpdateModel fromJson(Map<String, dynamic> json) {
    return ForceUpdateModel(
      version: json['version'] as String,
      forceUpdate: json['force_update'] as bool,
    );
  }
}
```

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


## Contributing

Contributions are welcome! Feel free to submit a pull request or open an issue to suggest improvements