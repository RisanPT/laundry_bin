// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_box_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkBoxControllerHash() =>
    r'bfceefc2c0770c4dc10bbc50fab25b6e37ff2294';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CheckBoxController
    extends BuildlessAutoDisposeNotifier<List<bool>> {
  late final int length;

  List<bool> build(
    int length,
  );
}

/// See also [CheckBoxController].
@ProviderFor(CheckBoxController)
const checkBoxControllerProvider = CheckBoxControllerFamily();

/// See also [CheckBoxController].
class CheckBoxControllerFamily extends Family<List<bool>> {
  /// See also [CheckBoxController].
  const CheckBoxControllerFamily();

  /// See also [CheckBoxController].
  CheckBoxControllerProvider call(
    int length,
  ) {
    return CheckBoxControllerProvider(
      length,
    );
  }

  @override
  CheckBoxControllerProvider getProviderOverride(
    covariant CheckBoxControllerProvider provider,
  ) {
    return call(
      provider.length,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'checkBoxControllerProvider';
}

/// See also [CheckBoxController].
class CheckBoxControllerProvider
    extends AutoDisposeNotifierProviderImpl<CheckBoxController, List<bool>> {
  /// See also [CheckBoxController].
  CheckBoxControllerProvider(
    int length,
  ) : this._internal(
          () => CheckBoxController()..length = length,
          from: checkBoxControllerProvider,
          name: r'checkBoxControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checkBoxControllerHash,
          dependencies: CheckBoxControllerFamily._dependencies,
          allTransitiveDependencies:
              CheckBoxControllerFamily._allTransitiveDependencies,
          length: length,
        );

  CheckBoxControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.length,
  }) : super.internal();

  final int length;

  @override
  List<bool> runNotifierBuild(
    covariant CheckBoxController notifier,
  ) {
    return notifier.build(
      length,
    );
  }

  @override
  Override overrideWith(CheckBoxController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CheckBoxControllerProvider._internal(
        () => create()..length = length,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        length: length,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CheckBoxController, List<bool>>
      createElement() {
    return _CheckBoxControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckBoxControllerProvider && other.length == length;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, length.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CheckBoxControllerRef on AutoDisposeNotifierProviderRef<List<bool>> {
  /// The parameter `length` of this provider.
  int get length;
}

class _CheckBoxControllerProviderElement
    extends AutoDisposeNotifierProviderElement<CheckBoxController, List<bool>>
    with CheckBoxControllerRef {
  _CheckBoxControllerProviderElement(super.provider);

  @override
  int get length => (origin as CheckBoxControllerProvider).length;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
