// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commentListHash() => r'8e0885c6deb80cb84e913e7a47f2a2d71e05be97';

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

typedef CommentListRef = AutoDisposeFutureProviderRef<List<Comment>>;

/// See also [commentList].
@ProviderFor(commentList)
const commentListProvider = CommentListFamily();

/// See also [commentList].
class CommentListFamily extends Family<AsyncValue<List<Comment>>> {
  /// See also [commentList].
  const CommentListFamily();

  /// See also [commentList].
  CommentListProvider call(
    int postId,
  ) {
    return CommentListProvider(
      postId,
    );
  }

  @override
  CommentListProvider getProviderOverride(
    covariant CommentListProvider provider,
  ) {
    return call(
      provider.postId,
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
  String? get name => r'commentListProvider';
}

/// See also [commentList].
class CommentListProvider extends AutoDisposeFutureProvider<List<Comment>> {
  /// See also [commentList].
  CommentListProvider(
    this.postId,
  ) : super.internal(
          (ref) => commentList(
            ref,
            postId,
          ),
          from: commentListProvider,
          name: r'commentListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commentListHash,
          dependencies: CommentListFamily._dependencies,
          allTransitiveDependencies:
              CommentListFamily._allTransitiveDependencies,
        );

  final int postId;

  @override
  bool operator ==(Object other) {
    return other is CommentListProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
