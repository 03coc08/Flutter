import 'package:flutter/material.dart';
import 'package:messenger_app/theme/app_colors.dart';
import 'package:messenger_app/widgets/round_icon_button.dart';
import 'package:messenger_app/widgets/search_field.dart';
import 'package:messenger_app/widgets/user_avatar.dart';
import 'package:messenger_app/models/chat_item.dart';
import 'package:messenger_app/models/story.dart';
import 'package:messenger_app/screens/chat_detail_screen.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  static const _stories = <Story>[
    Story('Neymar', 'assets/images/neymar.png'),
    Story('Gareth', 'assets/images/bale.png'),
    Story('Martha', 'assets/images/avatar.png'),
    Story('Yamal', 'assets/images/yamal.png'),
  ];

  static const _chats = <ChatItem>[
    ChatItem(
      name: 'Martin',
      message: "You: What's up!",
      time: '9:40 AM',
      avatar: 'assets/images/avatar.png',
      isOnline: true,
      isUnread: true,
    ),
    ChatItem(
      name: 'Gareth Bale',
      message: 'You: OK, thanks!',
      time: '9:25 AM',
      avatar: 'assets/images/bale.png',
      isOnline: true,
    ),
    ChatItem(
      name: 'Lamine Yamal',
      message: 'See you tomorrow.',
      time: 'Fri',
      avatar: 'assets/images/yamal.png',
    ),
    ChatItem(
      name: 'Neymar Jr.',
      message: 'Have a good day!',
      time: 'Fri',
      avatar: 'assets/images/neymar.png',
      isOnline: true,
    ),
    ChatItem(
      name: 'Lionel Messi',
      message: 'The plan looks great.',
      time: 'Thu',
      avatar: 'assets/images/messi.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
          sliver: SliverToBoxAdapter(child: _buildHeader(context)),
        ),
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(16, 4, 16, 12),
          sliver: SliverToBoxAdapter(child: SearchField()),
        ),
        SliverToBoxAdapter(child: _buildStories()),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          sliver: SliverList.separated(
            itemCount: _chats.length,
            separatorBuilder: (_, _) => const SizedBox(height: 2),
            itemBuilder: (context, index) {
              final chat = _chats[index];
              return ListTile(
                minTileHeight: 72,
                contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                leading: UserAvatar(
                  image: chat.avatar,
                  radius: 27,
                  isOnline: chat.isOnline,
                ),
                title: Text(
                  chat.name,
                  style: TextStyle(
                    fontWeight: chat.isUnread
                        ? FontWeight.w700
                        : FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  '${chat.message}  ·  ${chat.time}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: chat.isUnread ? Colors.white70 : AppColors.darkMuted,
                  ),
                ),
                trailing: chat.isUnread
                    ? const CircleAvatar(
                        radius: 5,
                        backgroundColor: AppColors.primary,
                      )
                    : const Icon(
                        Icons.check_circle_outline_rounded,
                        color: AppColors.darkMuted,
                        size: 17,
                      ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => ChatDetailScreen(
                      name: chat.name,
                      avatar: chat.avatar,
                      isOnline: chat.isOnline,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final showCamera = constraints.maxWidth >= 320;
        return Row(
          children: [
            const UserAvatar(
              image: 'assets/images/messi.png',
              radius: 21,
              isOnline: true,
            ),
            const SizedBox(width: 12),
            const Text(
              'Chats',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
            ),
            const Spacer(),
            if (showCamera) ...[
              RoundIconButton(icon: Icons.camera_alt_rounded, onPressed: () {}),
              const SizedBox(width: 8),
            ],
            RoundIconButton(icon: Icons.edit_rounded, onPressed: () {}),
          ],
        );
      },
    );
  }

  Widget _buildStories() {
    return SizedBox(
      height: 88,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _stories.length + 1,
        separatorBuilder: (_, _) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          if (index == 0) {
            return const SizedBox(
              width: 58,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: AppColors.darkSurface,
                    child: Icon(Icons.add_rounded),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Your story',
                    maxLines: 1,
                    style: TextStyle(color: AppColors.darkMuted, fontSize: 12),
                  ),
                ],
              ),
            );
          }

          final story = _stories[index - 1];
          return SizedBox(
            width: 58,
            child: Column(
              children: [
                UserAvatar(image: story.avatar, radius: 27, isOnline: true),
                const SizedBox(height: 6),
                Text(
                  story.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.darkMuted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
