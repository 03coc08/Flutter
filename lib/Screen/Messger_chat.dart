import 'package:flutter/material.dart';

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({super.key});

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  int _currentIndex = 0;
  final List<Map<String, String>> stories = [
    {
      'name': 'Joshua',
      'img':
          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150',
    },
    {
      'name': 'Martin',
      'img':
          'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?w=150',
    },
    {
      'name': 'Karen',
      'img':
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
    },
    {
      'name': 'Martha',
      'img':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
    },
    {
      'name': 'q',
      'img':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
    },
    {
      'name': 'sss',
      'img':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
    },
    {
      'name': 'ddd',
      'img':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
    },
    {
      'name': 'dsdsds',
      'img':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
    },
  ];
  final List<Map<String, String>> chats = [
    {
      'name': 'Martin Randolph',
      'msg': "You: What's man! · 9:40 AM",
      'img':
          'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?w=150',
    },
    {
      'name': 'Andrew Parker',
      'msg': 'You: Ok, thanks! · 9:25 AM',
      'img':
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150',
    },
    {
      'name': 'Karen Castillo',
      'msg': 'You: Ok, See you in To... · Fri',
      'img':
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
    },
    {
      'name': 'Maisy Humphrey',
      'msg': 'Have a good day, Maisy! · Fri',
      'img':
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150',
    },
    {
      'name': 'Joshua Lawrence',
      'msg': 'The business plan loo... · Thu',
      'img':
          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150',
    },
    {
      'name': 'Joshua Lawrence',
      'msg': 'The business plan loo... · Thu',
      'img':
          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150',
    },
    {
      'name': 'Joshua Lawrence',
      'msg': 'The business plan loo... · Thu',
      'img':
          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150',
    },
    {
      'name': 'Joshua Lawrence',
      'msg': 'The business plan loo... · Thu',
      'img':
          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150',
    },
    {
      'name': 'Joshua Lawrence',
      'msg': 'The business plan loo... · Thu',
      'img':
          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // 1. THANH TIÊU ĐỀ (APP BAR)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Chats',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  _buildRoundButton(Icons.camera_alt),
                  const SizedBox(width: 10),
                  _buildRoundButton(Icons.edit),
                ],
              ),
            ),

            // 2. THANH TÌM KIẾM (SEARCH)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: const Color(0xFF262626),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const TextField(
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 15,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF757575),
                      size: 20,
                    ),
                    border: InputBorder.none,
                    isCollapsed: true,
                  ),
                ),
              ),
            ),

            // 3. DANH SÁCH CUỘN
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 12),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 54,
                              height: 54,
                              decoration: const BoxDecoration(
                                color: Color(0xFF262626),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Your story',
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        ...stories.map((story) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 27,
                                      backgroundImage: NetworkImage(
                                        story['img']!,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        width: 14,
                                        height: 14,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF31A24C),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  story['name']!,
                                  style: const TextStyle(
                                    color: Color(0xFF757575),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Danh sách tin nhắn
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: chats.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 18),
                    itemBuilder: (context, index) {
                      final chat = chats[index];
                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 27,
                            backgroundImage: NetworkImage(chat['img']!),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chat['name']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  chat['msg']!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color(0xFF757575),
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.circle_outlined,
                            size: 14,
                            color: Color(0xFF757575),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // 4. FOOTER
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          border: Border(top: BorderSide(color: Color(0xFF1F1F1F), width: 0.5)),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xFF65676B),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble, size: 24),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                label: Text(
                  '2',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Color(0xFF31A24C),
                child: Icon(Icons.people, size: 26),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore, size: 24),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  // Nút tròn nhỏ trên Header
  Widget _buildRoundButton(IconData icon) {
    return Container(
      width: 36,
      height: 36,
      decoration: const BoxDecoration(
        color: Color(0xFF262626),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }
}
