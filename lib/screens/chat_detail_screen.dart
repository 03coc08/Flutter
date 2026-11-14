import 'package:flutter/material.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({
    required this.name,
    required this.avatar,
    required this.isOnline,
    super.key,
  });

  final String name;
  final String avatar;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(useMaterial3: true),
      child: Scaffold(
        backgroundColor: const Color(0xFF0B0B0D),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0B0B0D),
          surfaceTintColor: Colors.transparent,
          titleSpacing: 0,
          leading: IconButton(
            tooltip: 'Back',
            onPressed: () => Navigator.maybePop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          ),
          title: Row(
            children: [
              CircleAvatar(radius: 18, backgroundImage: AssetImage(avatar)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      isOnline ? 'Active now' : 'Messenger',
                      style: const TextStyle(
                        color: Color(0xFF9A9AA1),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              tooltip: 'Audio call',
              onPressed: () {},
              icon: const Icon(Icons.call_rounded, color: Color(0xFF0A7CFF)),
            ),
            IconButton(
              tooltip: 'Video call',
              onPressed: () {},
              icon: const Icon(
                Icons.videocam_rounded,
                color: Color(0xFF0A7CFF),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.fromLTRB(14, 16, 14, 8),
                children: [
                  _buildUserIntro(context),
                  const SizedBox(height: 20),
                  const Text(
                    'Today, 9:32 PM',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF9A9AA1), fontSize: 11),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text('👋', style: TextStyle(fontSize: 48)),
                  ),
                  const SizedBox(height: 6),
                  _ReceivedMessage(avatar: avatar, text: 'Hello!'),
                  _ReceivedMessage(avatar: avatar, text: 'How are you doing?'),
                ],
              ),
            ),
            const _MessageComposer(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserIntro(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 42, backgroundImage: AssetImage(avatar)),
        const SizedBox(height: 12),
        Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 4),
        const Text(
          "You're friends on Facebook",
          style: TextStyle(color: Color(0xFF9A9AA1), fontSize: 13),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: 70,
          height: 38,
          child: Stack(
            children: [
              const Positioned(
                left: 0,
                child: CircleAvatar(
                  radius: 19,
                  backgroundImage: AssetImage('assets/images/messi.png'),
                ),
              ),
              Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 19,
                  backgroundImage: AssetImage(avatar),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Say hi to your Facebook friend, $name.',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Color(0xFF9A9AA1), fontSize: 12),
        ),
      ],
    );
  }
}

class _ReceivedMessage extends StatelessWidget {
  const _ReceivedMessage({required this.avatar, required this.text});

  final String avatar;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(radius: 12, backgroundImage: AssetImage(avatar)),
          const SizedBox(width: 7),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
              decoration: BoxDecoration(
                color: const Color(0xFF2B2C30),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageComposer extends StatelessWidget {
  const _MessageComposer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 7, 6, 8),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final showMediaButtons = constraints.maxWidth >= 360;
            return Row(
              children: [
                const _ComposerButton(icon: Icons.add_circle_rounded),
                if (showMediaButtons) ...[
                  const _ComposerButton(icon: Icons.camera_alt_rounded),
                  const _ComposerButton(icon: Icons.image_rounded),
                ],
                Expanded(
                  child: TextField(
                    minLines: 1,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Message',
                      filled: true,
                      fillColor: const Color(0xFF202124),
                      contentPadding: const EdgeInsets.fromLTRB(14, 10, 4, 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.sentiment_satisfied_alt_rounded),
                      ),
                    ),
                  ),
                ),
                const _ComposerButton(icon: Icons.thumb_up_rounded),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ComposerButton extends StatelessWidget {
  const _ComposerButton({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      visualDensity: VisualDensity.compact,
      color: const Color(0xFF0A7CFF),
      icon: Icon(icon, size: 22),
    );
  }
}
