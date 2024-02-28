// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saturation_g_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saturationGHash() => r'6e890f36c66ce3d64598726877c27656a2104b98';

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

abstract class _$SaturationG extends BuildlessAutoDisposeAsyncNotifier<String> {
  late final int arg;

  FutureOr<String> build(
    int arg,
  );
}

/// See also [SaturationG].
@ProviderFor(SaturationG)
const saturationGProvider = SaturationGFamily();

/// See also [SaturationG].
class SaturationGFamily extends Family<AsyncValue<String>> {
  /// See also [SaturationG].
  const SaturationGFamily();

  /// See also [SaturationG].
  SaturationGProvider call(
    int arg,
  ) {
    return SaturationGProvider(
      arg,
    );
  }

  @override
  SaturationGProvider getProviderOverride(
    covariant SaturationGProvider provider,
  ) {
    return call(
      provider.arg,
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
  String? get name => r'saturationGProvider';
}

/// See also [SaturationG].
class SaturationGProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SaturationG, String> {
  /// See also [SaturationG].
  SaturationGProvider(
    int arg,
  ) : this._internal(
          () => SaturationG()..arg = arg,
          from: saturationGProvider,
          name: r'saturationGProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saturationGHash,
          dependencies: SaturationGFamily._dependencies,
          allTransitiveDependencies:
              SaturationGFamily._allTransitiveDependencies,
          arg: arg,
        );

  SaturationGProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.arg,
  }) : super.internal();

  final int arg;

  @override
  FutureOr<String> runNotifierBuild(
    covariant SaturationG notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(SaturationG Function() create) {
    return ProviderOverride(
      origin: this,
      override: SaturationGProvider._internal(
        () => create()..arg = arg,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        arg: arg,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SaturationG, String> createElement() {
    return _SaturationGProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaturationGProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaturationGRef on AutoDisposeAsyncNotifierProviderRef<String> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _SaturationGProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SaturationG, String>
    with SaturationGRef {
  _SaturationGProviderElement(super.provider);

  @override
  int get arg => (origin as SaturationGProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
