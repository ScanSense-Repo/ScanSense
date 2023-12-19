// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rankHash() => r'416d2c89322efe4300f3f9634f9f73a7d4207f35';

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

/// See also [rank].
@ProviderFor(rank)
const rankProvider = RankFamily();

/// See also [rank].
class RankFamily extends Family<AsyncValue<List<Rank>>> {
  /// See also [rank].
  const RankFamily();

  /// See also [rank].
  RankProvider call(
    String bidang,
  ) {
    return RankProvider(
      bidang,
    );
  }

  @override
  RankProvider getProviderOverride(
    covariant RankProvider provider,
  ) {
    return call(
      provider.bidang,
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
  String? get name => r'rankProvider';
}

/// See also [rank].
class RankProvider extends AutoDisposeFutureProvider<List<Rank>> {
  /// See also [rank].
  RankProvider(
    String bidang,
  ) : this._internal(
          (ref) => rank(
            ref as RankRef,
            bidang,
          ),
          from: rankProvider,
          name: r'rankProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$rankHash,
          dependencies: RankFamily._dependencies,
          allTransitiveDependencies: RankFamily._allTransitiveDependencies,
          bidang: bidang,
        );

  RankProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.bidang,
  }) : super.internal();

  final String bidang;

  @override
  Override overrideWith(
    FutureOr<List<Rank>> Function(RankRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RankProvider._internal(
        (ref) => create(ref as RankRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        bidang: bidang,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Rank>> createElement() {
    return _RankProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RankProvider && other.bidang == bidang;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bidang.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RankRef on AutoDisposeFutureProviderRef<List<Rank>> {
  /// The parameter `bidang` of this provider.
  String get bidang;
}

class _RankProviderElement extends AutoDisposeFutureProviderElement<List<Rank>>
    with RankRef {
  _RankProviderElement(super.provider);

  @override
  String get bidang => (origin as RankProvider).bidang;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
