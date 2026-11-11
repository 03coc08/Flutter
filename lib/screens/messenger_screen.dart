import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme/app_colors.dart';
import 'package:flutter_application_2/theme/app_theme.dart';
import 'package:flutter_application_2/screens/chats_page.dart';
import 'package:flutter_application_2/screens/discover_page.dart';
import 'package:flutter_application_2/screens/people_screen.dart';
import 'package:flutter_application_2/models/session.dart';
import 'package:flutter_application_2/services/mattermost_api.dart';

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({super.key, required this.session, required this.api});

  final Session session;
  final MattermostApi api;

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  int _currentIndex = 0;

  static const _pages = <Widget>[ChatsPage(), PeopleScreen(), DiscoverPage()];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.dark,
      child: Scaffold(
        key: const Key('messengerScreen'),
        body: SafeArea(
          bottom: false,
          child: IndexedStack(index: _currentIndex, children: _pages),
        ),
        bottomNavigationBar: NavigationBar(
          height: 70,
          backgroundColor: AppColors.darkNavigation,
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
