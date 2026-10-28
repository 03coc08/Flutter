import 'package:flutter/material.dart';

import 'chat_detail_screen.dart';
import 'people_screen.dart';

const _backgroundColor = Color(0xFF0B0B0D);
const _surfaceColor = Color(0xFF202124);
const _mutedColor = Color(0xFF9A9AA1);
const _primaryColor = Color(0xFF0A7CFF);

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({super.key});

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  int _currentIndex = 0;

  static const _pages = <Widget>[_ChatsPage(), PeopleScreen(), _DiscoverPage()];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: _backgroundColor,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: _surfaceColor,
          hintStyle: const TextStyle(color: _mutedColor),
          prefixIconColor: _mutedColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      child: Scaffold(
        key: const Key('messengerScreen'),
        body: SafeArea(
          bottom: false,
          child: IndexedStack(index: _currentIndex, children: _pages),
        ),
        bottomNavigationBar: NavigationBar(
          height: 70,
          backgroundColor: const Color(0xFF111113),
          indicatorColor: const Color(0x332D88FF),
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() => _currentIndex = index);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.chat_bubble_outline_rounded),
              selectedIcon: Icon(Icons.chat_bubble_rounded),
              label: 'Chats',
            ),
            NavigationDestination(
              icon: Icon(Icons.people_outline_rounded),
              selectedIcon: Icon(Icons.people_rounded),
              label: 'People',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore_rounded),
              label: 'Discover',
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatsPage extends StatelessWidget {
  const _ChatsPage();

  static const _stories = <_Story>[
    _Story('Neymar', 'assets/images/neymar.png'),
    _Story('Gareth', 'assets/images/bale.png'),
    _Story('Martha', 'assets/images/avatar.png'),
    _Story('Yamal', 'assets/images/yamal.png'),
  ];

  static const _chats = <_ChatItem>[
    _ChatItem(
      name: 'Martin',
      message: "You: What's up!",
      time: '9:40 AM',
      avatar: 'assets/images/avatar.png',
      isOnline: true,
      isUnread: true,
    ),
    _ChatItem(
      name: 'Gareth Bale',
      message: 'You: OK, thanks!',
      time: '9:25 AM',
      avatar: 'assets/images/bale.png',
      isOnline: true,
    ),
    _ChatItem(
      name: 'Lamine Yamal',
      message: 'See you tomorrow.',
      time: 'Fri',
      avatar: 'assets/images/yamal.png',
    ),
    _ChatItem(
      name: 'Neymar Jr.',
      message: 'Have a good day!',
      time: 'Fri',
      avatar: 'assets/images/neymar.png',
      isOnline: true,
    ),
    _ChatItem(
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
          sliver: SliverToBoxAdapter(child: _SearchField()),
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
                leading: _Avatar(
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
                    color: chat.isUnread ? Colors.white70 : _mutedColor,
                  ),
                ),
                trailing: chat.isUnread
                    ? const CircleAvatar(
                        radius: 5,
                        backgroundColor: _primaryColor,
                      )
                    : const Icon(
                        Icons.check_circle_outline_rounded,
                        color: _mutedColor,
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
            const _Avatar(
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
              _RoundButton(icon: Icons.camera_alt_rounded, onPressed: () {}),
              const SizedBox(width: 8),
            ],
            _RoundButton(icon: Icons.edit_rounded, onPressed: () {}),
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
                    backgroundColor: _surfaceColor,
                    child: Icon(Icons.add_rounded),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Your story',
                    maxLines: 1,
                    style: TextStyle(color: _mutedColor, fontSize: 12),
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
                _Avatar(image: story.avatar, radius: 27, isOnline: true),
                const SizedBox(height: 6),
                Text(
                  story.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: _mutedColor, fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DiscoverPage extends StatelessWidget {
  const _DiscoverPage();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
      children: [
        const Text(
          'Discover',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 16),
        const _SearchField(hint: 'Search communities'),
        const SizedBox(height: 24),
        const Text(
          'Suggested',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        _CommunityCard(
          title: 'Football fans',
          subtitle: 'News, highlights and conversations.',
          icon: Icons.sports_soccer_rounded,
          color: const Color(0xFF27AE60),
          onTap: () {},
        ),
        const SizedBox(height: 12),
        _CommunityCard(
          title: 'Flutter developers',
          subtitle: 'Share ideas and build beautiful apps.',
          icon: Icons.flutter_dash_rounded,
          color: const Color(0xFF4A90E2),
          onTap: () {},
        ),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({this.hint = 'Search'});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(Icons.search_rounded),
        contentPadding: const EdgeInsets.symmetric(vertical: 11),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    required this.image,
    required this.radius,
    this.isOnline = false,
  });

  final String image;
  final double radius;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: radius * 2,
      child: Stack(
        children: [
          CircleAvatar(radius: radius, backgroundImage: AssetImage(image)),
          if (isOnline)
            Positioned(
              right: 0,
              bottom: 1,
              child: Container(
                width: radius * 0.52,
                height: radius * 0.52,
                decoration: BoxDecoration(
                  color: const Color(0xFF31A24C),
                  shape: BoxShape.circle,
                  border: Border.all(color: _backgroundColor, width: 2.5),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _RoundButton extends StatelessWidget {
  const _RoundButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      style: IconButton.styleFrom(backgroundColor: _surfaceColor),
      icon: Icon(icon, size: 20),
    );
  }
}

class _CommunityCard extends StatelessWidget {
  const _CommunityCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _surfaceColor,
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.18),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(subtitle, style: const TextStyle(color: _mutedColor)),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: onTap,
      ),
    );
  }
}

class _Story {
  const _Story(this.name, this.avatar);

  final String name;
  final String avatar;
}

class _ChatItem {
  const _ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.avatar,
    this.isOnline = false,
    this.isUnread = false,
  });

  final String name;
  final String message;
  final String time;
  final String avatar;
  final bool isOnline;
  final bool isUnread;
}
