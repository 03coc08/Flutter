import 'package:flutter/material.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});

  static const _people = <_Person>[
    _Person('Martin', 'assets/images/avatar.png', 'Active now', true),
    _Person('Neymar Jr.', 'assets/images/neymar.png', 'Active now', true),
    _Person('Lamine Yamal', 'assets/images/yamal.png', 'Active 5m ago', false),
    _Person('Gareth Bale', 'assets/images/bale.png', 'Active 10m ago', false),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 21,
                  backgroundImage: AssetImage('assets/images/messi.png'),
                ),
                const SizedBox(width: 12),
                const Text(
                  'People',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                ),
                const Spacer(),
                IconButton.filled(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFF202124),
                  ),
                  icon: const Icon(Icons.person_add_alt_1_rounded),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          sliver: SliverToBoxAdapter(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search_rounded),
              ),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          sliver: SliverToBoxAdapter(child: _StoryAction()),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          sliver: SliverList.separated(
            itemCount: _people.length,
            separatorBuilder: (_, _) => const Divider(indent: 76),
            itemBuilder: (context, index) {
              final person = _people[index];
              return ListTile(
                minTileHeight: 68,
                contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                leading: _PersonAvatar(person: person),
                title: Text(
                  person.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  person.status,
                  style: const TextStyle(color: Color(0xFF9A9AA1)),
                ),
                trailing: IconButton(
                  tooltip: 'Say hello',
                  onPressed: () {},
                  icon: const Icon(
                    Icons.waving_hand_rounded,
                    color: Color(0xFFFFC83D),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _StoryAction extends StatelessWidget {
  const _StoryAction();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xFF202124),
          child: Icon(Icons.add_rounded),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your story', style: TextStyle(fontWeight: FontWeight.w700)),
            SizedBox(height: 2),
            Text(
              'Share a photo or write something',
              style: TextStyle(color: Color(0xFF9A9AA1), fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}

class _PersonAvatar extends StatelessWidget {
  const _PersonAvatar({required this.person});

  final _Person person;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 50,
      child: Stack(
        children: [
          CircleAvatar(radius: 25, backgroundImage: AssetImage(person.avatar)),
          if (person.isOnline)
            Positioned(
              right: 0,
              bottom: 1,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: const Color(0xFF31A24C),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF0B0B0D), width: 2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Person {
  const _Person(this.name, this.avatar, this.status, this.isOnline);

  final String name;
  final String avatar;
  final String status;
  final bool isOnline;
}
