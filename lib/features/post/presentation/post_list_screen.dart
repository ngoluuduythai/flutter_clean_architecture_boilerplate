import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_boilerplate/common_widgets/async_value_widget.dart';
import 'package:flutter_clean_architecture_boilerplate/features/post/domain/entity/post.dart';
import 'package:flutter_clean_architecture_boilerplate/features/post/presentation/post_list_provider.dart';
import 'package:flutter_clean_architecture_boilerplate/styles/app_text_styles.dart';
import 'package:flutter_clean_architecture_boilerplate/utils/async_value_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListScreen extends ConsumerStatefulWidget {
  const PostListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostListScreenState();
}

class _PostListScreenState extends ConsumerState<PostListScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      getPostsProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Material(
      child: Scaffold(
        body: Consumer(builder: (context, ref, child) {
          return AsyncValueWidget<List<Post>>(
            value: ref.watch(getPostsProvider),
            data: (posts) {
              return ListView.separated(
                itemCount: posts.length,
                separatorBuilder: (context, position) {
                  return const Divider();
                },
                itemBuilder: (context, position) {
                  return ListTile(
                    dense: true,
                    leading: const Icon(Icons.cloud_circle),
                    title: Text(
                      '${posts[position].name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: AppTextStyles.subtitle,
                    ),
                    subtitle: Text(
                      '${posts[position].color}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                  );
                },
              );
            },
          );
        }),
      ),
    );
  }
}
