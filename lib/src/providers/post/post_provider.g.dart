// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postListHash() => r'778e43c1b1402a6823b873fcc9d3b06296adf21d';

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

typedef PostListRef = AutoDisposeFutureProviderRef<List<Post>>;

/// See also [postList].
@ProviderFor(postList)
const postListProvider = PostListFamily();

/// See also [postList].
class PostListFamily extends Family<AsyncValue<List<Post>>> {
  /// See also [postList].
  const PostListFamily();

  /// See also [postList].
  PostListProvider call(
    int filterIndex,
  ) {
    return PostListProvider(
      filterIndex,
    );
  }

  @override
  PostListProvider getProviderOverride(
    covariant PostListProvider provider,
  ) {
    return call(
      provider.filterIndex,
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
  String? get name => r'postListProvider';
}

/// See also [postList].
class PostListProvider extends AutoDisposeFutureProvider<List<Post>> {
  /// See also [postList].
  PostListProvider(
    this.filterIndex,
  ) : super.internal(
          (ref) => postList(
            ref,
            filterIndex,
          ),
          from: postListProvider,
          name: r'postListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postListHash,
          dependencies: PostListFamily._dependencies,
          allTransitiveDependencies: PostListFamily._allTransitiveDependencies,
        );

  final int filterIndex;

  @override
  bool operator ==(Object other) {
    return other is PostListProvider && other.filterIndex == filterIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filterIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$postFilterIndexHash() => r'19a3ea6f68b02807b733f603e7e8ce457d52bd96';

/// See also [PostFilterIndex].
@ProviderFor(PostFilterIndex)
final postFilterIndexProvider =
    AutoDisposeNotifierProvider<PostFilterIndex, int>.internal(
  PostFilterIndex.new,
  name: r'postFilterIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$postFilterIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PostFilterIndex = AutoDisposeNotifier<int>;
String _$saveNewPostHash() => r'd7f9f908d093cdb9db1b96415a05c6260c62f036';

/// See also [SaveNewPost].
@ProviderFor(SaveNewPost)
final saveNewPostProvider =
    AutoDisposeNotifierProvider<SaveNewPost, SavePost>.internal(
  SaveNewPost.new,
  name: r'saveNewPostProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$saveNewPostHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SaveNewPost = AutoDisposeNotifier<SavePost>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
