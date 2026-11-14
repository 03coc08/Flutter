import 'package:flutter/material.dart';
import 'package:messenger_app/widgets/search_field.dart';
import 'package:messenger_app/widgets/community_card.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

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
        const SearchField(hint: 'Search communities'),
        const SizedBox(height: 24),
        const Text(
          'Suggested',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        CommunityCard(
          title: 'Football fans',
          subtitle: 'News, highlights and conversations.',
          icon: Icons.sports_soccer_rounded,
          color: const Color(0xFF27AE60),
          onTap: () {},
        ),
        const SizedBox(height: 12),
        CommunityCard(
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
