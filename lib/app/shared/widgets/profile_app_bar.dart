import 'package:flutter/material.dart';
import 'package:provide_it/provide_it.dart';

import '../../features/user/view_models/user_view_model.dart';
import '../../features/user/views/profile_view.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({
    super.key,
    this.leading,
  });
  final Widget? leading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;
    final user = context.watch<UserViewModel>().user;

    return AppBar(
      backgroundColor: colors.surface,
      leading: leading ??
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_rounded),
          ),
      actions: [
        InkWell(
          onTap: () => ProfileView.go(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.name,
                  style:
                      texts.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  radius: 24,
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
