import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `post.dart` with the code generated
// by freezed
part 'post.freezed.dart';
// optional: since our [Post] class is serialisable,
// we must add this line. but if [Post] was not serialisable,
// we could skip it.
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    /// Documentation for your parameter
    @Default(null) int? id,
    @Default('') String? name,
    @Default(0) int? year,
    @Default('') String? color,
    @JsonKey(name: 'pantone_value') @Default('') String? pantoneValue,
  }) = _Post;

  /// For custom getters and methods to work. Must not have any parameter.
  // ignore: unused_element
  const Post._();

  /// Converts a JSON [Map] into a [Post] instance
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
