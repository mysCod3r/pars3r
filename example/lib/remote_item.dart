// ignore_for_file: public_member_api_docs, document_ignores

import 'package:example/main.dart';
import 'package:example/models/index.dart';
import 'package:example/utils/index.dart';
import 'package:flutter/foundation.dart';
import 'package:pars3r/pars3r.dart';

/// Alias for `RemoteConfigPrimitiveModel<T>`, simplifying usage for primitive
/// types like `String`, `int`, `bool`, and `double`.
typedef _Primitive<T extends Object> = ParsablePrimitiveModel<T>;

/// Alias for `RemoteConfigEnumModel<T>`, simplifying usage for enum-based.
typedef _Enum<T extends IParsableEnum> = ParsableEnumModel<T>;

/// Enum for different remote configuration items, each with its associated
/// data type and parsing logic.
///
/// This enum defines the different types of remote configuration items
/// that can be fetched from Firebase Remote Config. Each item is associated
/// with a specific type and a `fetch` method to retrieve its value.
enum RemoteItem<T extends IParsableModel<T>, R> {
  welcomeMessage<_Primitive<String>, _Primitive<String>>(),
  appTheme<_Enum<AppTheme>, _Enum<AppTheme>>(),
  maxRetryCount<_Primitive<int>, _Primitive<int>>(),
  isPromoEnabled<_Primitive<bool>, _Primitive<bool>>(),
  percentage<_Primitive<double>, _Primitive<double>>(),
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
